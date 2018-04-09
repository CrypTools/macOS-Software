//
//  NSColor.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

public extension NSColor {
    
    /**
     Returns an NSColor instance from the given hex value
     
     - parameter rgbValue: The hex value to be used for the color
     - parameter alpha:    The alpha value of the color
     
     - returns: A NSColor instance from the given hex value
     */
    public class func hexColor(rgbValue: Int, alpha: CGFloat = 1.0) -> NSColor {
        
        return NSColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue:((CGFloat)(rgbValue & 0xFF))/255.0, alpha:alpha)
        
    }
    
}
