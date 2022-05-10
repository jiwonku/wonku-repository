//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 지원구 on 2022/05/05.
//

import Foundation


func mutifly(opt1 : Double , opt2 : Double) -> Double {
    return opt1 * opt2
}

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
 
    var operation: Dictionary<String,Operation> = [
        "Pi" : Operation.Constant(.pi),
        "e" : Operation.Constant(M_E),
        "root" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "multifly" : Operation.BinaryOperation(mutifly),
        "=" : Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    
    func performOperation(symbol: String) {
        
        if let operation = operation[symbol] {
                        
            switch operation {
            case .Constant(let value):
                accumulator = value
                break;
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
                break;
            case .BinaryOperation(let function):
                
                break;
            case .Equals:
                
                break;
            }
        }
        
        
        //        switch symbol {
        //        case "Pi":
        //            accumulator = Double.pi
        //        case "root":
        //            accumulator = sqrt(accumulator)
        //        default :
        //            break
        //        }
        
        
    }
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
