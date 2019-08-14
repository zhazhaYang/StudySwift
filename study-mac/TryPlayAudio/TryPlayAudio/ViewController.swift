//
//  ViewController.swift
//  TryPlayAudio
//
//  Created by yang on 2019/7/23.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    
    @IBOutlet weak var timeSlider: NSSlider!
    @IBOutlet weak var timeLabel: NSTextField!

    var audioPlayer: AVAudioPlayer!
    var data: NSData!
    var timer: Timer!
    var accompanyUrl: URL!
    
    var acc2: URL!
    
    var recorder: AVAudioRecorder!
    var recordUrl: URL!
    var recordPath: String!
    var recordSetting: [String: Any]!
    
    var songUrl: URL!
    
    var directoryPath: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = NSView()
        // Do any additional setup after loading the view.
        
        accompanyUrl = Bundle.main.url(forResource: "星月神话", withExtension: "mp3")
        acc2 = Bundle.main.url(forResource: "紫色激情", withExtension: "wav")
        let data = NSData(contentsOf: acc2)!
        savePanel(recordData: data)
        //let resourcePath = Bundle.main.path(forSoundResource: "星月神话")
        
       // let savePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("/record.acc")
        directoryPath = NSHomeDirectory() + "/Documents/Records"
        try! FileManager.default.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
        recordPath = directoryPath + "/record.wav"
        recordUrl = URL(fileURLWithPath: recordPath)
        
        let path = directoryPath + "/song.m4a"
        songUrl = URL(fileURLWithPath: path)
        
        //try! FileManager.default.removeItem(atPath: directoryPath)
        //let url = URL(fileURLWithPath: resourcePath!)
        //data = NSData(contentsOf: accompanyUrl!)
        //data = try! Data(contentsOf: url)
//        do {
//            //audioPlayer = try AVAudioPlayer(data: data as Data)
//            audioPlayer = try AVAudioPlayer(contentsOf: saveUrl)
//            //audioPlayer.volume = 0.7
//        } catch {
//            print("初始化失败")
//        }
//        if audioPlayer != nil {
//            timeSlider.maxValue = audioPlayer.duration
//        }
        
            recordSetting = [AVSampleRateKey: NSNumber(value: 44100.0),//采样率
            AVFormatIDKey: NSNumber(value: kAudioFormatLinearPCM),//音频格式
            AVLinearPCMBitDepthKey: NSNumber(value: 16),//采样位数
            AVNumberOfChannelsKey: NSNumber(value: 2),//通道数
            AVEncoderAudioQualityKey: NSNumber(value: AVAudioQuality.min.rawValue)//录音质量
        ]
        
        //convert()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func tickTime() {
        timeSlider.integerValue += 1
        timeLabel.stringValue = String(self.timeSlider.integerValue)
    }
    
    func savePanel(recordData data: NSData) {
        let panel = NSSavePanel()
        panel.title = "导出录音"
        panel.canCreateDirectories = true
        panel.showsTagField = false
        panel.allowedFileTypes = ["wav"]
        panel.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
        panel.begin { (result) in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                let url = panel.url!
                data.write(to: url, atomically: true)
            }
        }
    }
    
    func convert() {
        let url = Bundle.main.url(forResource: "紫色激情", withExtension: "wav")
        let data = NSData(contentsOf: url!)
        if let ex = mimeType(for: data! as Data) {
            print(ex)
            print("1SUCCESS")
        } else {
            print("1FAILD")
        }

        let url2 = Bundle.main.url(forResource: "星月神话", withExtension: "mp3")
        let data2 = NSData(contentsOf: url2!)
        if let ex2 = mimeType(for: data2! as Data) {
            print(ex2)
            print("2SUCCESS")
        } else {
            print("2FAILD")
        }
        
        //let path = directoryPath + "/神神"
        //let saveUrl = URL(fileURLWithPath: path)
        //data?.write(to: saveUrl, atomically: true)
    }
    
    func mimeType(for data: Data) -> String? {
        var b: UInt8 = 0
        data.copyBytes(to: &b, count: 1)
        print("BBB\(b)")
        switch b {
        case 0x52:
            return "wav"
        case 0x49:
            return "mp3"
        default:
            return nil
        }
    }
    
    func setAudioPlayer(audioUrl url: URL?) -> Bool {
        if url == nil {
            return false
        }
        do {
            //audioPlayer = try AVAudioPlayer(data: data as Data)
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch {
            print("播放初始化失败")
            return false
        }
        return true
    }
    
    @IBAction func play(_ sender: NSButton) {

        if setAudioPlayer(audioUrl: accompanyUrl) {
            timeSlider.maxValue = audioPlayer.duration
        }
        beginPlay()
    }
    
    @IBAction func stop(_ sender: NSButton) {
        if audioPlayer != nil {
            audioPlayer.stop()
            if timer != nil {
                timer.invalidate()
            }
            if !audioPlayer.isPlaying {
                print("停止播放")
            }
        }
    }
    
    @IBAction func beginRecord(_ sender: NSButton) {
        //recorder.prepareToRecord()
        do {
            recorder = try AVAudioRecorder(url: recordUrl, settings: recordSetting)
        } catch {
            print("录音初始化失败！")
            return
        }
        if recorder == nil {
            print("录音初始化失败！")
            return
        }
        recorder.record()
        if recorder.isRecording {
            print("录音中")
        }
    }
    
    @IBAction func stopRecord(_ sender: NSButton) {
        if recorder != nil {
            recorder.stop()
            if !recorder.isRecording {
                print("停止录音")
            }
            
            if FileManager.default.fileExists(atPath: recordPath) {
                print("录音成功！")
            } else {
                print("录音失败！")
            }
        }
        
    }
    
    
    @IBAction func playRecord(_ sender: NSButton) {
        if !setAudioPlayer(audioUrl: recordUrl) {
            print("播放录音失败了！")
        }
        beginPlay()
    }
    
    @IBAction func playSong(_ sender: NSButton) {
        if !setAudioPlayer(audioUrl: songUrl) {
            print("播放合成的歌曲失败了！")
        }
        beginPlay()
    }
    
    
    @IBAction func composeSong(_ sender: NSButton) {
        songUrl = blendAudio()
    }
    
    func beginPlay() {
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.tickTime), userInfo: nil, repeats: true)
            if audioPlayer.isPlaying {
                print("播放中")
            }
        }
    }
    
    
    func blendAudio() -> URL {
        let recordAsset = AVURLAsset(url: recordUrl, options: nil)
    
        let accompanyAsset = AVURLAsset(url: accompanyUrl, options: nil)
        let composition: AVMutableComposition = AVMutableComposition()
        let appendedAudioTrack1: AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid)!
        let appendedAudioTrack2: AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: 0)!
        let assetTrack1: AVAssetTrack = recordAsset.tracks(withMediaType: AVMediaType.audio)[0]
        let assetTrack2: AVAssetTrack = accompanyAsset.tracks(withMediaType: AVMediaType.audio)[0]
        let timeRange1 = CMTimeRangeMake(start: CMTime.zero, duration: recordAsset.duration)
        let timeRange2 = CMTimeRangeMake(start: CMTime.zero, duration: accompanyAsset.duration)
        do {
            try appendedAudioTrack1.insertTimeRange(timeRange1, of: assetTrack1, at: CMTime.zero)
            try appendedAudioTrack2.insertTimeRange(timeRange2, of: assetTrack2, at: CMTime.zero)
        } catch {
            print("拼接失败了！")
        }
        
        let export: AVAssetExportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetAppleM4A)!
        
        let path = directoryPath + "/song1.m4a"
        let url = URL(fileURLWithPath: path)
        export.outputURL = url
        export.outputFileType = AVFileType.m4a
        export.exportAsynchronously (
            completionHandler: { () -> Void in
                print("export...", export)
                switch export.status {
                case .failed:
                    print("导出失败了！")
                    break
                case .completed:
                    print("导出成功！")
                    break
                case .waiting:
                    print("正在导出中...")
                    break
                default:
                    break
                }
            })
        
            return url
    }
    
    
    @IBAction func popOut(_ sender: NSButton) {
        let show = TextHUD()
        show.showWaitingWithText(size: self.view.frame.size ,text: "正在加载中", autoRemove: true)    }
    
    
}

