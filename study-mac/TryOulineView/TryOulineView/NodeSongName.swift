//
//  NodeSongName.swift
//  TryOulineView
//
//  Created by yang on 2019/7/25.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class NodeSongName: NSObject {
    var songName = ""
    var isLeaf = false
    var children = [LeafRecordName]()
}
