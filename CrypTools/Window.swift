//
//  Window.swift
//  CrypTools
//
//  Created by Arthur Guiot on 12/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class Window: NSWindow {
	override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
		self.backgroundColor = NSColor.hexColor(rgbValue: 0x292929);
	}
}
