//
//  ciphers.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Foundation

typealias f = (_ text: String, _ key: String) -> String
class Ciphers {
    var name = [String]()
    var call = [Any]()
    func add(_ name: String, _ callback: (_ text: String, _ key: String) -> String) {
        self.name.append(name)
        self.call.append(callback)
    }
    func get(_ name: String) -> f {
        let i = self.name.index(of: name)
        return call[i!] as! f
    }
    init() {
        self.add("Caesar - Encrypt", {
            text, key in
            return text.CaesarEncrypt(Int(key))
        })
        self.add("Caesar - Decrypt", {
            text, key in
            return text.CaesarDecrypt(Int(key))
        })
        self.add("Base64 - Encrypt", {
            text, key in
            return text.b64encrypt
        })
        self.add("Base64 - Decrypt", {
            text, key in
            return text.b64decrypt!
        })
        self.add("BitShift - Encrypt", {
            text, key in
            return text.BitShiftEncrypt(key)
        })
        self.add("BitShift - Decrypt", {
            text, key in
            return text.BitShiftDecrypt(key)
        })
        self.add("Emoji - Encrypt", {
            text, key in
            return text.EmojiEncrypt
        })
        self.add("Emoji - Decrypt", {
            text, key in
            return text.EmojiDecrypt
        })
        self.add("md5", {
            text, key in
            return text.md5
        })
        self.add("sha256", {
            text, key in
            return text.sha256
        })
    }
}
