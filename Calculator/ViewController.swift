//
//  ViewController.swift
//  Calculator
//
//  Created by Freddy Oakes on 2/22/15.
//  Copyright (c) 2015 The Hofmeister Kink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Definition of Variables
    
    var add = false; var subtract = false; var multiply = false; var divide = false
    var theCount = 0
	var calculate = false
    var firstValue = 0
    var secondValueBool = false
    var secondValueString = ""
	var secondValueReady = 0
    var writeAZero = false
    var displayText = ""
    var answer = 0
    var writeToConsole = false
    
    // Display
    
    @IBOutlet weak var display: UILabel!
    
    // Clear Button
    
    @IBAction func clear(sender: AnyObject) {
        
        displayText.removeAll(keepCapacity: true)
        writeAZero = true
        add = false
        subtract = false
        multiply = false
        divide = false
        theCount = 0
        if writeToConsole == true { writeToConsole("clear") }
        writeToDisplay()
    }
    
    // Backspace Button
    
    @IBAction func backspace(sender: AnyObject) {
        
        displayText = String(makeSubstring(0, endValue: -1))
        if writeToConsole == true { writeToConsole("backspace") }
        writeToDisplay()
    }
    
    // Calculate Button
    
    @IBAction func enter(sender: AnyObject) {
    
        calculate = true
        var answer = calculateResult()
		display.text = answer
        if writeToConsole == true { writeToConsole("enter") }
		resetValues()
    }
    
    // The other Buttons
    
    @IBAction func add(sender: AnyObject)       { operatorButton("+") }
    @IBAction func subtract(sender: AnyObject)  { operatorButton("-") }
    @IBAction func multiply(sender: AnyObject)  { operatorButton("x") }
    @IBAction func divide(sender: AnyObject)    { operatorButton("/") }
    
    @IBAction func zero(sender: AnyObject)      { digitButton("0") }
    @IBAction func one(sender: AnyObject)       { digitButton("1") }
    @IBAction func two(sender: AnyObject)       { digitButton("2") }
    @IBAction func three(sender: AnyObject)     { digitButton("3") }
    @IBAction func four(sender: AnyObject)      { digitButton("4") }
    @IBAction func five(sender: AnyObject)      { digitButton("5") }
    @IBAction func six(sender: AnyObject)       { digitButton("6") }
    @IBAction func seven(sender: AnyObject)     { digitButton("7") }
    @IBAction func eight(sender: AnyObject)     { digitButton("8") }
    @IBAction func nine(sender: AnyObject)      { digitButton("9") }
    @IBAction func decimal(sender: AnyObject)   { digitButton("0") }
    
    // Digit Buttons
    
    func digitButton(value: String) {
        
        if secondValueBool == true { secondValueString += value }
        displayText += value
        theCount++
        if writeToConsole == true { writeToConsole(value) }
        writeToDisplay()
    }
    
    // Operator Buttons
    
    func operatorButton(value: String) {
        
        if value == "+"      { add = true }
        else if value == "-" { subtract = true }
        else if value == "x" { multiply = true }
        else if value == "/" { divide = true }
        displayText += value
        if (theCount != 0) { firstValue = makeSubstring(0, endValue: -1) }
        else if (theCount == 0) { firstValue = answer }       // sets Previous answer as firstValue
        theCount = 0
        secondValueReady++
        secondValueBool = true
        if writeToConsole == true { writeToConsole(value) }
        writeToDisplay()
    }
    
    // Write to Display
    
    func writeToDisplay() {
        
        display.text = displayText
    }
    
    // Write to Console the current variable values
    
    func writeToConsole(buttonPressedIs: String) {
        
        println("/////////////////////////////////")
        println("You pressed a \(buttonPressedIs)")
        println("displayText =      \(displayText)")
        println("add =              \(add)")
        println("subtract =         \(subtract)")
        println("multiply =          \(multiply)")
        println("divide =            \(divide)")
        println("theCount =          \(theCount)")
        println("calculate =         \(displayText)")
        println("firstValue =        \(firstValue)")
        println("secondValueBool =   \(secondValueBool)")
        println("secondValueString = \(secondValueString)")
        println("secondValueReady =  \(secondValueReady)")
        println("writeAZero =        \(writeAZero)")
    }
    
    // Resets Variables
	
	func resetValues() {

		theCount = 0
        add = false; subtract = false; multiply = false; divide = false
		calculate = false
        displayText = ""
        firstValue = 0
   		secondValueReady = 0
        secondValueString = ""
        secondValueBool = false
        writeAZero = false
	}
	
    // Makes a SubString
    
	func makeSubstring(startValue: Int, endValue: Int) -> Int {
		
        var x = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, startValue), end: advance(displayText.endIndex, endValue))).toInt()!
		
		return x
	}
    
    // Calculates the Result
    
    func calculateResult() -> String {
        
        var pos = 0
		var answerString = ""
        var secondValue = 0
        
        if (secondValueString != "") {
            secondValue = secondValueString.toInt()!
        } else {
            secondValue = 0
        }
        
        if (secondValueReady == 2 || calculate == true) {
            
            if (add == true) {
                answer = firstValue + secondValue
            } else if (subtract == true) {
                answer = firstValue - secondValue
            } else if (multiply == true) {
                answer = firstValue * secondValue
            } else if (divide == true) {
                answer = firstValue / secondValue
            } else {
                println("Reached the else clause")
            }
            
			answerString = String(answer)
        } else {
			answer = -0
        }

        resetValues()
        return answerString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
