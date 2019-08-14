//
//  ViewController.swift
//  tryCamera
//
//  Created by yang on 2019/3/26.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var session = AVCaptureSession()
    var frontCamera: AVCaptureDeviceInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoDevices = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        
//        let f = videoDevices.filter({ return $0.position == .front }).first
//
        frontCamera = try? AVCaptureDeviceInput(device: videoDevices)
    }


}

