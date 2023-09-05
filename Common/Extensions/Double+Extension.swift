//
//  Double+Extension.swift
//  Common
//
//  Created by Anderson F Carvalho on 05/09/23.
//

import Foundation

public extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
