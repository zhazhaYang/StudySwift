//
//  ViewController.swift
//  State Lab
//
//  Created by yang on 2019/4/21.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var label: UILabel!
    private var smiley: UIImage!
    private var smileyView: UIImageView!
    private var segmentedController: UISegmentedControl!
    private var index = 0
    private var animate = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = view.bounds
        
        let labelFrame = CGRect(origin: CGPoint(x: bounds.origin.x, y: bounds.midY - 50), size: CGSize(width: bounds.size.width, height: 100))
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size: 70)
        label.text = "Bezinga!"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        
        let simleyFrame = CGRect(x: bounds.midX - 42, y: bounds.midY/2 - 42, width: 84, height: 84)
        
        smileyView = UIImageView(frame: simleyFrame)
        smileyView.contentMode = UIView.ContentMode.center
        let smileyPath = Bundle.main.path(forResource: "smiley", ofType: "png")!
        smiley = UIImage(contentsOfFile: smileyPath)
        smileyView.image = smiley
        
        segmentedController = UISegmentedControl(items: ["One", "Two", "Three", "Four"])
        segmentedController.frame = CGRect(x: bounds.origin.x + 20, y: 50, width: bounds.size.width - 20, height: 30)
        segmentedController.addTarget(self, action: #selector(ViewController.selectionChanged(_:)), for: UIControl.Event.valueChanged)
        
        view.addSubview(label)
        view.addSubview(segmentedController)
        view.addSubview(smileyView)
        
        index = UserDefaults.standard.integer(forKey: "index")
        segmentedController.selectedSegmentIndex = index
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(ViewController.applicationWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
           center.addObserver(self, selector: #selector(ViewController.applicationDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
           center.addObserver(self, selector: #selector(ViewController.applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    func rotateLabelDown() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { (Bool) -> Void in
            self.rotateLabelUp()
        })
    }
    
    func rotateLabelUp() {
        UIView.animate(withDuration: 0.5, animations:{
            self.label.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { (Bool) -> Void in
            if self.animate {
                self.rotateLabelDown()
            }
        })
    }
    
    @objc func selectionChanged(_ sender: UISegmentedControl) {
        index = segmentedController.selectedSegmentIndex
    }
    
    @objc func applicationWillResignActive() {
        print("VC: \(#function)")
        animate = false
    }
    
    @objc func applicationDidBecomeActive() {
        print("VC: \(#function)")
        animate = true
        rotateLabelDown()
    }
    
    @objc func applicationDidEnterBackground() {
        print("VC: \(#function)")
        UserDefaults.standard.set(index, forKey: "index")
        
        let app = UIApplication.shared
        var taskId = UIBackgroundTaskIdentifier.invalid
        let id = app.beginBackgroundTask() {
            print("Background task ran out of time and was terminated")
            app.endBackgroundTask(taskId)
        }
        taskId = id
        
        if taskId == UIBackgroundTaskIdentifier.invalid {
            print("Failed to start background task!")
            return
        }
        
        DispatchQueue.main.async {
            print("Starting background task with \(app.backgroundTimeRemaining) seconds remaining")
            
            self.smiley = nil
            self.smileyView.image = nil
            
            Thread.sleep(forTimeInterval: 25)//simulate a lengthy procedure
            
            print("Finishing background task with \(app.backgroundTimeRemaining) seconds remaining")
            app.endBackgroundTask(taskId)
        }
    }
    
    @objc func applicationWillEnterForeground() {
        print("VC: \(#function)")
        let smileyPath = Bundle.main.path(forResource: "smiley", ofType: "png")!
        self.smiley = UIImage(contentsOfFile: smileyPath)
        self.smileyView.image = smiley
    }
    
}

