//
//  ViewController.swift
//  Calculator
//
//  Created by 지원구 on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false

    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
        
    private var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func perFormOperation(_ sender: UIButton) {
        
//        if let mathMathicalSymbol = sender.currentTitle {
//            if mathMathicalSymbol == "Pi" {
//                displayValue = Double.pi
//            } else if(mathMathicalSymbol == "multiply") {
//                displayValue = sqrt(displayValue)
//            }
//        }
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathmaticalsymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalsymbol)
        }
        
        displayValue = brain.result
    }
}

