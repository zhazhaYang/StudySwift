//
//  ViewController.swift
//  Persistence
//
//  Created by yang on 2019/4/8.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    fileprivate static let rootKey = "rootKey"
   
    @IBOutlet var lineFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileURL = self.dataFieldURL()
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }
            
            let data = NSMutableData(contentsOf: fileURL as URL)!
            //let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data as Data)
            let fourLines = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as Data) as! FourLines
           // unarchiver.finishDecoding()
            
            if let newLines = fourLines.lines {
                for i in 0..<newLines.count {
                    lineFields[i].text = newLines[i]
                }
            }
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(nitification:)), name: UIApplication.willResignActiveNotification, object: app)
    }
    
    @objc func applicationWillResignActive(nitification: NSNotification) {
        let fileURL = self.dataFieldURL()
        let fourLines = FourLines()
        let array = (self.lineFields as NSArray).value(forKey: "text") as! [String]
        fourLines.lines = array
        
        //let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        let data = try! NSKeyedArchiver.archivedData(withRootObject: fourLines, requiringSecureCoding: false)
        //archiver.encode(data, forKey: ViewController.rootKey)
        //archiver.finishEncoding()
        do{
            try data.write(to: fileURL as URL)
        } catch {
            print("Error is \(error)")
        }
    }
    
    func dataFieldURL() -> NSURL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url: NSURL?
        url = NSURL(fileURLWithPath: "")
        url = urls.first!.appendingPathComponent("data.archive") as NSURL
        return url!
    }

}

