//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 지원구 on 2022/05/05.
//

import Foundation


class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        
        switch symbol {
        case "Pi":
            accumulator = Double.pi
        case "multiply":
            accumulator = sqrt(accumulator)
        default :
            break
        }
    }
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
