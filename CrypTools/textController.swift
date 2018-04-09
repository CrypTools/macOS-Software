//
//  textController.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class TextController: NSViewController {
    
    
    @IBOutlet weak var TextIn: NSTextField!    
    @IBOutlet weak var CipherSelect: NSPopUpButtonCell!
    @IBOutlet weak var Key: NSTextField!
    @IBOutlet weak var TextOut: NSTextField!
    
    var coder = Ciphers().name[0]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor;
        CipherSelect.removeAllItems()
        Hash(nil)
        let c = Ciphers()
        CipherSelect.addItems(withTitles: c.name)
    }
    
    @IBAction func Encoder(_ sender: Any) {
        let i = CipherSelect.indexOfSelectedItem
        self.coder = Ciphers().name[i]
    }
    @IBAction func Hash(_ sender: Any?) {
        let c = Ciphers()
        let fe = c.get(self.coder)
        TextOut.stringValue = fe(TextIn.stringValue, Key.stringValue)
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
