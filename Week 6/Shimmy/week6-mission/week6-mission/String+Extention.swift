//
//  String+Extention.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/14.
//

import Foundation

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}

extension Double {
    var toInt: Int? {
        return Int(self)
    }
}

extension FloatingPoint {
    var isInteger: Bool {
        return rounded() == self
    }
}
