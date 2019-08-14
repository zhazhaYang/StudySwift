//
//  DetailViewController.swift
//  TinyPix
//
//  Created by yang on 2019/4/16.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pixView: TinyPixView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if detailItem != nil && isViewLoaded {
            pixView.document = detailItem! as? TinyPixDocument
            pixView.setNeedsDisplay()
        }
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        updateTintColor()
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.onSettingChanged(notification:)), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    @objc func onSettingChanged(notification: Notification) {
        updateTintColor()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UserDefaults.didChangeNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let doc = detailItem as? UIDocument {
            doc.close(completionHandler: nil)
        }
    }
    
    private func updateTintColor() {
        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        let tintColor = TinyPixUtils.getTintColorForIndex(index: selectedColorIndex)
        pixView.tintColor = tintColor
        pixView.setNeedsDisplay()
    }
    
}

