//
//  ViewController.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var Drop: NSTextField!
    @IBOutlet weak var Load: NSTextField!
    @IBOutlet weak var CipherSelect: NSPopUpButton!
    @IBOutlet weak var Encrypt: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor;
        
        let c = Ciphers()
        CipherSelect.addItems(withTitles: c.name)
        // Hide everything
        Load.isHidden = true
        CipherSelect.isHidden = true
        Encrypt.isHidden = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

