//
//  NSView.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa
import DockProgress

class DropView: NSView {
    
    @IBOutlet weak var Drop: NSTextField!
    @IBOutlet weak var Load: NSTextField!
    @IBOutlet weak var CipherSelect: NSPopUpButton!
    @IBOutlet weak var Encrypt: NSButton!
    @IBOutlet weak var Key: NSTextField!
    
    var coder = Ciphers().name[0]
    
    var filePath: String?
    let expectedExt = Extensions().ext
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
		
		DockProgress.style = .circle(radius: 62, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
		
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor
        
		if #available(OSX 10.13, *) {
			registerForDraggedTypes([NSPasteboard.PasteboardType.URL, NSPasteboard.PasteboardType.fileURL])
		} else {
			// Fallback on earlier versions
		}
    }
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        return true
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if checkExtension(sender) == true {
            self.layer?.backgroundColor = NSColor.blue.cgColor
            return .copy
        } else {
            return NSDragOperation()
        }
    }
    
    fileprivate func checkExtension(_ drag: NSDraggingInfo) -> Bool {
        guard let board = drag.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
            let path = board[0] as? String
            else { return false }
        
        let suffix = URL(fileURLWithPath: path).pathExtension
        for ext in self.expectedExt {
            if ext.lowercased() == suffix {
                return true
            }
        }
        return false
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        self.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        self.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let pasteboard = sender.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
            let path = pasteboard[0] as? String
            else { return false }
        
        //GET YOUR FILE PATH !!!
        self.filePath = path
        Swift.print("FilePath: \(path)")
        ask()
        return true
    }
    func ask() {
        Drop.isHidden = true
        Key.isHidden = false
        CipherSelect.isHidden = false
        Encrypt.isHidden = false
    }
    @IBAction func Encoder(_ sender: Any) {
        let i = CipherSelect.indexOfSelectedItem
        self.coder = Ciphers().name[i]
    }
    @IBAction func ToggleEncrypt(_ sender: Any) {
		DockProgress.progressValue = 0
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .warning
            alert.addButton(withTitle: "OK")
            alert.addButton(withTitle: "Cancel")
            return alert.runModal() == .alertFirstButtonReturn
        }
        Key.isHidden = true
        CipherSelect.isHidden = true
        Encrypt.isHidden = true
        Load.isHidden = false
        do {
            let input = try NSString( contentsOfFile: self.filePath!, encoding: String.Encoding.utf8.rawValue )
			DockProgress.progressValue = 0.5
            let save = NSSavePanel()
            save.begin(completionHandler: {
                result in
                let c = Ciphers()
                let fe = c.get(self.coder)
                let text = fe(input as String, self.Key.stringValue)
				DockProgress.progressValue = 0.9
                if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    let filename = save.url
                    do {
                        try text.write(to: filename!, atomically: true, encoding: String.Encoding.utf8)
                        _ = dialogOKCancel(question: "Done", text: "Your file was succefully saved at \(save.url!)")
						DockProgress.progressValue = 1
                    } catch {
                        _ = dialogOKCancel(question: "Error 1", text: "Sorry, but something wrong happened.\nPlease inform the CrypTools developers of this error by submitting an issue on GitHub.")
                    }
                }
            })
			DockProgress.progressValue = 0
        } catch {
            _ = dialogOKCancel(question: "Error 0", text: "Sorry, but something wrong happened.\nPlease inform the CrypTools developers of this error by submitting an issue on GitHub.")
        }
        // Hides everything back
        Load.isHidden = true
        Drop.isHidden = false
    }
    
}
