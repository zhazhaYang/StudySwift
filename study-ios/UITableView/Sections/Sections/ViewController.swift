//
//  ViewController.swift
//  Sections
//
//  Created by yang on 2019/4/1.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    
    @IBOutlet weak var tableView: UITableView!

    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let nameDict = NSDictionary(contentsOfFile: path!)
        names = nameDict as? [String: [String]]
        keys = (nameDict!.allKeys as! [String]).sorted()
        
        let resultController = SearchResultsController()
        resultController.names = names
        resultController.keys = keys
        searchController = UISearchController(searchResultsController: resultController)
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultController
    }

    //MARK:-
    //MARK: Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {//需要多少分区
        return keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//分区中需要多少行
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath)
        let key = keys[indexPath.section]
        let nameSection = names[key]
        cell.textLabel?.text = nameSection![indexPath.row]
        return cell
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }

}

