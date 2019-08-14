//
//  SecondViewController.swift
//  BridgeController
//
//  Created by yang on 2019/4/6.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var engineSwitch: UISwitch!
    @IBOutlet var warpFactorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notification:)), name: UIApplication.willEnterForegroundNotification, object: app)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func applicationWillEnterForeground(notification: NSNotification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }
    
    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
    }
    

    @IBAction func onEngineSwitchTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
        defaults.synchronize()
    }
    
    @IBAction func onWarpSliderGragged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    @IBAction func onSettingButtonTapped(_ sender: UIButton) {
        let application = UIApplication.shared
        let url = URL(string: UIApplication.openSettingsURLString)! as URL
        if application.canOpenURL(url) {
            application.open(url, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""): ""], completionHandler: nil)
        }
    }
}

