//
//  TouchBar Controller.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

@available(OSX 10.12.2, *)
class TouchBar_Controller: NSTouchBar {
    @IBAction func Learn(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://github.com/CrypTools")!)
    }
    @IBAction func GitHub(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://github.com/CrypTools")!)
    }
    @IBAction func Website(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://cryptools.github.io")!)
    }
}
