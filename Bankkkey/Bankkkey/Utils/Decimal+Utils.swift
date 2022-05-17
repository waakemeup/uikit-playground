//
//  DecimalUtils.swift
//  Bankkkey
//
//  Created by Ruby on 2022/5/8.
//

import Foundation

extension Decimal {
    var doubleValue:Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
