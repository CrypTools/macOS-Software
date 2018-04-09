//
//  key.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class EditorWindow: NSWindow {
    override func keyDown(with event: NSEvent) {
        super.keyDown(with: event)
        Swift.print("Caught a key down: \(String(describing: event.characters))!")
        
    }
}
