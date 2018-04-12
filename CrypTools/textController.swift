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
        
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.keyEv(with: $0)
            return $0
        }
    }
    
    @IBAction func Encoder(_ sender: Any) {
        let i = CipherSelect.indexOfSelectedItem
        self.coder = Ciphers().name[i]
        TextIn.stringValue = ""
        Hash(nil)
    }
    @IBAction func Hash(_ sender: Any?) {
        let c = Ciphers()
        let fe = c.get(self.coder)
        var out = ""
        do {
            out = try fe(TextIn.stringValue, Key.stringValue)
        } catch {
            out = "Error!"
        }
        TextOut.stringValue = out
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    func keyEv(with event: NSEvent) {
        super.keyDown(with: event)
        Hash(nil)
    }
}
