//
//  ViewController.swift
//  Table Cells
//
//  Created by yang on 2019/3/29.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView: UITableView!
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"],
        ["Name" : "Mac mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let xib = UINib(nibName: "NameAndColorCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 100
    }

    //MARK:-
    //MARK: Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as? NameAndColorCell
        let rowData = computers[indexPath.row]
        cell?.name = rowData["Name"]!
        cell?.color = rowData["Color"]!
        return cell!
    }

}

