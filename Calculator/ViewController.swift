//
//  ViewController.swift
//  Calculator
//
//  Created by Freddy Oakes on 2/22/15.
//  Copyright (c) 2015 The Hofmeister Kink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var display: UILabel!

    var add = false; var subtract = false; var multiply = false; var divide = false
    var operations = 0
    var theCount = 0
	var calculate = false
    var firstValue = 0
    var secondValueBool = false
    var secondValueString = ""
	var secondValueReady = 0
    var writeAZero = false
    var displayText = ""
    
    @IBAction func clear(sender: AnyObject) {
        
        displayText.removeAll(keepCapacity: true)
        writeAZero = true
        add = false
        subtract = false
        multiply = false
        divide = false
        theCount = 0
        writeToDisplay()
    }
    
    @IBAction func backspace(sender: AnyObject) {
        
        //displayText.removeLast()
		// Removes last char of the string displayText
        displayText = String(makeSubstring(startValue: 0,endValue: -1))
        writeToDisplay()
    }
    
    
    @IBAction func enter(sender: AnyObject) {
    
		calculate = true
        var answer = calculateResult()
		display.text = answer
		resetValues()
    }
    
    @IBAction func add(sender: AnyObject) {
        
        displayText += "+"
        add = true
        firstValue = makeSubstring(startValue: 0, endValue: -theCount)
        theCount = 0
		secondValueReady++
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func subtract(sender: AnyObject) {
        
        displayText += "-"
        subtract = true
        firstValue = makeSubstring(startValue: 0, endValue: -theCount)
        theCount = 0
		secondValueReady++
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func multiply(sender: AnyObject) {
        
        displayText += "x"
        multiply = true
        firstValue = makeSubstring(startValue: 0, endValue: -theCount)
        theCount = 0
		secondValueReady++
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func divide(sender: AnyObject) {
        
        displayText += "/"
        divide = true
        firstValue = makeSubstring(startValue: 0, endValue: -theCount)
        theCount = 0
		secondValueReady++
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func decimal(sender: AnyObject) {
        
        writeToDisplay()
    }
    
    @IBAction func zero(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "0"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "0"
            secondValueString += "0"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func one(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "1" }	
		displayText += "1"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func two(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "2" }	
		displayText += "2"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func three(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "3" }	
		displayText += "3"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func four(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "4" }	
		displayText += "4"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func five(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "5" }	
		displayText += "5"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func six(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "6" }	
		displayText += "6"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func seven(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "7" }	
		displayText += "7"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func eight(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "8" }	
		displayText += "8"
        theCount++
		writeToDisplay()
    }
    
    @IBAction func nine(sender: AnyObject) {
        
		if secondValueBool == true { secondValueString += "9" }	
		displayText += "9"
        theCount++
		writeToDisplay()
    }
    
    func writeToDisplay() {
       
        display.text = displayText
    }
	
	func resetValues() {

		theCount = 0
		add = false
		subtract = false
		multiply = false
		divide = false
		secondValueReady = 0
		calculate = false
	}
	
	func makeSubstring(startValue: Int = 0, endValue: Int = 0) -> Int {
		
        var x:Int = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, startValue), end: advance(displayText.endIndex, endValue))).toInt()!
		
		return x
	}
    
    func calculateResult() -> String {
        
        var pos = 0
		var answer = 0
		var answerString = ""
        
		var secondValue = secondValueString.toInt()!
        
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
