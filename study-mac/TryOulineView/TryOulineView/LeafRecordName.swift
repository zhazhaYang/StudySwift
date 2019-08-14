//
//  LeafRecordName.swift
//  TryOulineView
//
//  Created by yang on 2019/7/25.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class LeafRecordName: NSObject {
    var recordName = ""
    var hasChild = false
    
    init (recordName name: String)
    {
        self.recordName = name
    }
}
