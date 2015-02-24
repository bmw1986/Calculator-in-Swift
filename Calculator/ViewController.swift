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
    var writeAZero = false
    var displayText:[Int] = []
    
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
        
        displayText.removeLast()
        writeToDisplay()
    }
    
    
    @IBAction func enter(sender: AnyObject) {
    
        calculateResult()
    }
    
    @IBAction func add(sender: AnyObject) {
        
        add = true
        writeToDisplay()
    }
    
    @IBAction func subtract(sender: AnyObject) {
        
        subtract = true
        writeToDisplay()
    }
    
    @IBAction func multiply(sender: AnyObject) {
        
        multiply = true
        writeToDisplay()
    }
    
    @IBAction func divide(sender: AnyObject) {
        
        divide = true
        writeToDisplay()
    }
    
    @IBAction func decimal(sender: AnyObject) {
        
        writeToDisplay()
    }
    
    @IBAction func zero(sender: AnyObject) {
        
        displayText.append(0)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func one(sender: AnyObject) {
        
        displayText.append(1)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func two(sender: AnyObject) {
        
        displayText.append(2)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func three(sender: AnyObject) {
        
        displayText.append(3)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func four(sender: AnyObject) {
        
        displayText.append(4)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func five(sender: AnyObject) {
        
        displayText.append(5)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func six(sender: AnyObject) {
        
        displayText.append(6)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func seven(sender: AnyObject) {
        
        displayText.append(7)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func eight(sender: AnyObject) {
        
        displayText.append(8)
        theCount++
        writeToDisplay()
    }
    
    @IBAction func nine(sender: AnyObject) {
        
        displayText.append(9)
        theCount++
        writeToDisplay()
    }
    
    func writeToDisplay() {
        
        var text = ""
        var newText = ""
        
        if (add == true) {
            if (theCount >= 2){
                newText = convertArrayToString()
            } else {
                text = convertArrayToString()
                newText = text + "+"
            }
        } else if (subtract == true) {
            if (theCount >= 2){
                newText = convertArrayToString()
            } else {
                text = convertArrayToString()
                newText = text + "-"
            }

        } else if (multiply == true) {
            if (theCount >= 2){
                newText = convertArrayToString()
            } else {
                text = convertArrayToString()
                newText = text + "x"
            }
        } else if (divide == true) {
            if (theCount >= 2){
                newText = convertArrayToString()
            } else {
                text = convertArrayToString()
                newText = text + "/"
            }
        } else if (writeAZero == true) {
            newText = "0"
            writeAZero = false
        } else {
            newText = convertArrayToString()
        }

        display.text = newText
    }
    
    func convertArrayToString() -> String {
        
        var textToDisplay = ""
        
        for (var i = 0; i < displayText.count; i++) {
            textToDisplay = " \(textToDisplay)" + "\(displayText[i])"
        }
        
        return textToDisplay
    }
    
    func calculateResult() {
        
        var pos = 0
        var textToDisplay:String = ""
        var answer = 0
        
        textToDisplay = convertArrayToString()
        
        if (theCount == 2) {
            
            if (add == true) {
                answer = displayText[0] + displayText[1]
                displayText.removeLast()
                displayText[0] = answer
                add = false
            } else if (subtract == true) {
                answer = displayText[0] - displayText[1]
                displayText.removeLast()
                displayText[0] = answer
                subtract = false
            } else if (multiply == true) {
                answer = displayText[0] * displayText[1]
                displayText.removeLast()
                displayText[0] = answer
                multiply = false
            } else if (divide == true) {
                answer = displayText[0] / displayText[1]
                displayText.removeLast()
                displayText[0] = answer
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

