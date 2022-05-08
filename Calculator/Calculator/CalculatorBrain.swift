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
 
    var operation: Dictionary<String,Operation> = [
        "Pi" : Operation.Constant(.pi),
        "e" : Operation.Constant(M_E),
        "root" : Operation.UnaryOperation,
        "cos" : Operation.UnaryOperation
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation
        case BinaryOperation
        case Equals
    }
    
    
    func performOperation(symbol: String) {
//        switch symbol {
//        case "Pi":
//            accumulator = Double.pi
//        case "root":
//            accumulator = sqrt(accumulator)
//        default :
//            break
//        }
        
        
        if let operation = operation[symbol] {
                        
            switch operation {
            case .Constant(let value):
                accumulator = value
                break;
            case .UnaryOperation:
                
                break;
            case .BinaryOperation:
                
                break;
            case .Equals:
                
                break;
            default:
                break;
            }
        }
    }
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
