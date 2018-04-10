//
//  caesar.swift
//  CrypTools
//
//  Created by Arthur Guiot on 10/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

/*********************************
 *
 * Use: "Hello World!".encrypt(4)
 * => "Lipps$[svph%"
 *      "Lipps$[svph%".decrypt(4)
 * => "Hello World!"
 *
 *********************************/
extension String {
    func CaesarEncrypt(_ n: Int) -> String {
        var out = "";
        let unicode = Array(self.unicodeScalars.map { $0.value }).map { Int($0) }
        for i in unicode {
            out += String(Character(UnicodeScalar(i + n)!))
        }
        return out
    }
    func CaesarDecrypt(_ n: Int) -> String {
        var out = "";
        let unicode = Array(self.unicodeScalars.map { $0.value }).map { Int($0) }
        for i in unicode {
            out += String(Character(UnicodeScalar(i - n)!))
        }
        return out
    }
}
