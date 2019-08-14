//
//  ViewController.swift
//  TryTableView
//
//  Created by yang on 2019/7/16.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSTabViewDelegate
{

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var tabView: NSTabView!
    
    private let menus = ["我的曲谱", "我的录音", "曲谱下载"]
    private let menusCellId = "MusicID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tabView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: menusCellId), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = menus[row]
            return cell
        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selected = tableView.selectedRow;
        let str = "您选择了’" + menus[selected] + "‘！"
        let alert: NSAlert = NSAlert()
        alert.messageText = "点击事件"
        alert.informativeText = str
        alert.addButton(withTitle: "是的")
        alert.runModal()
        tabView.selectTabViewItem(at: selected)
    }
}

