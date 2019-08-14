//
//  ViewController.swift
//  Single Table
//
//  Created by yang on 2019/3/29.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey", "Thorin", "Dorin", "Nori", "Ori", "Balin", "Swalin", "Fili", "Kili", "Oin", "Gloin", "Bifur", "Bofur", "Bombur"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    //MARK:-
    //MARK: Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        cell?.detailTextLabel?.text = "Mr " + dwarves[indexPath.row]
        return cell!
    }
    
    //MARK:-
    //MARK: Table View Delegate Methods
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 90 : 50
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {//某行选中前调用
        if indexPath.row == 0 {
            return nil
        } else if indexPath.row % 2 == 0 {
            return NSIndexPath(row: indexPath.row + 1, section: indexPath.section) as IndexPath
        } else {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//某行选中后调用
        let selected = dwarves[indexPath.row]
        let alert = UIAlertController(title: "Selected", message: "you selected \(selected)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

