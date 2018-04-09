//
//  TabView controller.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class TabView_controller: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor;
    }
    
}
