//
//  ViewController.swift
//  StudyCustomFont
//
//  Created by yang on 2019/3/20.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    static let identifier = "FontCell"
    
    var data = ["30 Days Swift", "奋斗、理想", "字体来源【造字工房】，仅作学习用途", "劲黑体、致黑体、童心体", "the chance is given to the human who study hard", "努力留给自己，结果交给命运"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "Zapfino",
                     "Gaspar Regular"]
    
    var fontRowIndex=0
    
    @IBOutlet weak var fontLabel: UILabel!
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var fontTableView: UITableView!

    @objc func changeFontDidTouch(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
        fontLabel.text = "Custom Font"
        fontLabel.textColor = UIColor.white
        fontLabel.font = UIFont(name: self.fontNames[fontRowIndex], size:16)    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fontTableView.dataSource = self
        fontTableView.delegate = self
        changeFontLabel.layer.cornerRadius = 50
        changeFontLabel.layer.masksToBounds = true
        changeFontLabel.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeFontDidTouch(_:)))
        changeFontLabel.addGestureRecognizer(gesture)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: ViewController.identifier, for: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size:16)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

