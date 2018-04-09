//
//  NSView.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class DropView: NSView {
    
    @IBOutlet weak var Drop: NSTextField!
    @IBOutlet weak var Load: NSTextField!
    @IBOutlet weak var CipherSelect: NSPopUpButton!
    @IBOutlet weak var Encrypt: NSButton!
    
    
    var filePath: String?
    let expectedExt = [
        "jpg",
        "png",
        "gif",
        "txt",
        "tiff",
        "tif",
        "mp3",
        "mpeg",
        "mpg",
        "wav",
        "docx",
        "doc",
        "svg",
        "json",
        "js",
        "swift",
        "c",
        "md",
        "pdf",
        "zip"
    ]  //file extensions allowed for Drag&Drop (example: "jpg","png","docx", etc..)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.hexColor(rgbValue: 0x292929).cgColor
        
        registerForDraggedTypes([NSPasteboard.PasteboardType.URL, NSPasteboard.PasteboardType.fileURL])
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
        CipherSelect.isHidden = false
        Encrypt.isHidden = false
    }
    @IBAction func ToggleEncrypt(_ sender: Any) {
        let text = ""
        let save = NSSavePanel()
        save.begin(completionHandler: {
            result in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                let filename = save.url
                do {
                    try text.write(to: filename!, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    
                }
            }
        })
    }
    
}
