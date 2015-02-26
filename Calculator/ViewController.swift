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
    var firstValue = 0
    var secondValueBool = false
    var secondValueString = ""
    var secondValue = 0
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
        writeToDisplay()
    }
    
    
    @IBAction func enter(sender: AnyObject) {
    
        calculateResult()
    }
    
    @IBAction func add(sender: AnyObject) {
        
        displayText += "+"
        add = true
        firstValue = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, 0), end: advance(displayText.endIndex, -theCount))).toInt()!
        theCount = 0
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func subtract(sender: AnyObject) {
        
        displayText += "-"
        subtract = true
        firstValue = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, 0), end: advance(displayText.endIndex, -theCount))).toInt()!
        theCount = 0
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func multiply(sender: AnyObject) {
        
        displayText += "x"
        multiply = true
        firstValue = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, 0), end: advance(displayText.endIndex, -theCount))).toInt()!
        theCount = 0
        secondValueBool = true
        writeToDisplay()
    }
    
    @IBAction func divide(sender: AnyObject) {
        
        displayText += "/"
        divide = true
        firstValue = displayText.substringWithRange(Range<String.Index>(start: advance(displayText.startIndex, 0), end: advance(displayText.endIndex, -theCount))).toInt()!
        theCount = 0
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
        
        if (secondValueBool == false) {
            displayText += "1"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "1"
            secondValueString += "1"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func two(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "2"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "2"
            secondValueString += "2"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func three(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "3"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "3"
            secondValueString += "3"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func four(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "4"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "4"
            secondValueString += "4"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func five(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "5"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "5"
            secondValueString += "5"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func six(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "6"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "6"
            secondValueString += "6"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func seven(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "7"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "7"
            secondValueString += "7"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func eight(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "8"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "8"
            secondValueString += "8"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    @IBAction func nine(sender: AnyObject) {
        
        if (secondValueBool == false) {
            displayText += "9"
            theCount++
            writeToDisplay()
        } else if (secondValueBool == true) {
            displayText += "9"
            secondValueString += "9"
            theCount++
            writeToDisplay()
        } else {
            println("Error")
        }
    }
    
    func writeToDisplay() {
        
        var text = ""
        var newText = ""
        
        display.text = convertArrayToString()
    }
    
    func convertArrayToString() -> String {
        
        return displayText
    }
    
    func calculateResult() {
        
        var pos = 0
        var textToDisplay:String = ""
        var answer = 0
        
        textToDisplay = convertArrayToString()
        
        secondValue = secondValueString.toInt()!
        
        if (theCount == 2) {
            
            if (add == true) {
                answer = firstValue + secondValue
                add = false
            } else if (subtract == true) {
                answer = firstValue - secondValue
                subtract = false
            } else if (multiply == true) {
                answer = firstValue * secondValue
                multiply = false
            } else if (divide == true) {
                answer = firstValue / secondValue
                divide = false
            } else {
                println("Reached the else clause")
            }
            
            display.text = String(answer)
        }
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

