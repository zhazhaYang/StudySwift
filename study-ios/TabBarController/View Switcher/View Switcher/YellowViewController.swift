//
//  YellowViewController.swift
//  View Switcher
//
//  Created by yang on 2019/3/27.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yellowButtonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Yellow Button Pressed", message: "The button was pressed on the yellow view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did.", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
