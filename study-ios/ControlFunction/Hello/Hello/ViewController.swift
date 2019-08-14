//
//  ViewController.swift
//  Hello
//
//  Created by yang on 2019/3/1.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    var timer: Timer? = Timer()
    @IBOutlet weak var showTime: UILabel!
    var time: Float = 0.0 {
        // 属性观察器
        didSet {
            showTime.text = String(format: "%.1f", time)
        }
    }
    @objc func UpdateTimer() {
        time+=0.1
    }
    @IBAction func beginTimekeeping(_ sender: UIButton) {
        if sender.tag==0 {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
                    showTime.text=String(time)
        } else if sender.tag==1 {
            if let timerTemp = timer {
                timerTemp.invalidate()
            }
            timer = nil
        } else {
            if let timerTemp = timer {
                timerTemp.invalidate()
            }
            timer = nil
            time=0.0
        }
    }
}




