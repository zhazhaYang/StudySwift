//
//  ViewController.swift
//  TryTextHUD
//
//  Created by yang on 2019/8/12.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func popOutWaitingText(_ sender: NSButton) {
        let show = TextHUD()
        show.showWaitingWithText(size: self.view.frame.size ,text: "正在加载中", autoRemove: true)
    }
    
    
}

