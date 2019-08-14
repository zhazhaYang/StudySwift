//
//  ViewController.swift
//  StudyPlayVideo
//
//  Created by yang on 2019/3/21.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class viewController: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
    var data = [
        // 给项目编译后属于同一个module，所以Video不需要import就可以使用
        Video(image: "Screenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "Screenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "Screenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "Screenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "Screenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "Screenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    
    @IBAction func playVideoButtonDidTouch(_ sender: Any) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
}

extension viewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as!VideoCell
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        return cell
    }
}
