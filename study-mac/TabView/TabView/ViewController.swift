//
//  ViewController.swift
//  TabView
//
//  Created by yang on 2019/7/21.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTabViewDelegate {
    private var tabViewController: TabViewController!
    private var practiceContoller: PraticeController!
    private var audioController: AudioController!
    private var nsView: NsView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //tabViewController = TabViewController()
        //practiceContoller = PraticeController()
 //audioController = AudioController()

        
//               nsView = storyboard?.instantiateController(withIdentifier: "NSVIEW") as? NsView
//        nsView.view.frame = view.frame
//        self.addChild(nsView)
//        self.view.addSubview(nsView!.view)
//        nsView

        
        //        self.view.addSubview(tabViewController.view)
//        self.view.addSubview(practiceContoller.view)
//        self.view.addSubview(audioController.view)
//        audioController.view.frame = self.view.frame
//        self.addChild(tabViewController)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

