//
//  ciphers.swift
//  CrypTools
//
//  Created by Arthur Guiot on 09/04/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Foundation

typealias f = (_ text: String, _ key: Any) -> String
class Ciphers {
    var name = [String]()
    var call = [Any]()
    func add(_ name: String, _ callback: (_ text: String, _ key: Any) -> String) {
        self.name.append(name)
        self.call.append(callback)
    }
    func get(_ name: String) -> f {
        let i = self.name.index(of: name)
        return call[i!] as! f
    }
    init() {
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
