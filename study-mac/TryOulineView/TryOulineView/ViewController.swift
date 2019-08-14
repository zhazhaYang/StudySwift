//
//  ViewController.swift
//  TryOulineView
//
//  Created by yang on 2019/7/25.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var outLineView: NSOutlineView!
    
    var rootArray = [NodeSongName]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpDataModel()
        outLineView.dataSource = self
        outLineView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

extension ViewController {
    func  setUpDataModel() {
        let l1 = LeafRecordName(recordName: "Objective-C")
        let l2 = LeafRecordName(recordName: "Swift")
        let r1 = NodeSongName()
        r1.songName = "Language"
        r1.children = [l1, l2]
        
        let l3 = LeafRecordName(recordName: "星月神话伴奏")
        let l4 = LeafRecordName(recordName: "星月神话清吹")
        let r2 = NodeSongName()
        r2.songName = "星月神话"
        r2.children = [l3, l4]
        
        rootArray = [r1, r2]
    }
}

extension ViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? NodeSongName {
            return item.children.count
        }
        return rootArray.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return item is NodeSongName
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? NodeSongName {
            return item.children[index]
        }
        return rootArray[index]
    }
}

extension ViewController: NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var cell: NSTableCellView?
        if item is NodeSongName {
            cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
            cell?.textField?.stringValue = (item as! NodeSongName).songName
        } else {
            cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
            cell?.textField?.stringValue = ((item as? LeafRecordName)?.recordName)!
        }
        return cell
    }
    
}

