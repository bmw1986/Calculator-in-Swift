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
    
    var displayText:[Int] = []
    
    
    @IBAction func clear(sender: AnyObject) {
        
        displayText.removeLast()
        writeToDisplay()
        
    }
    
    @IBAction func enter(sender: AnyObject) {
    
        displayText.append(0)
        writeToDisplay()
        
    }
    
    @IBAction func add(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func subtract(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func multiply(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func divide(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func decimal(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func zero(sender: AnyObject) {
        
        displayText.append(0)
        writeToDisplay()
    }
    
    @IBAction func one(sender: AnyObject) {
        
        displayText.append(1)
        writeToDisplay()
    }
    
    @IBAction func two(sender: AnyObject) {
        
        displayText.append(2)
        writeToDisplay()
    }
    
    @IBAction func three(sender: AnyObject) {
        
        displayText.append(3)
        writeToDisplay()
    }
    
    @IBAction func four(sender: AnyObject) {
        
        displayText.append(4)
        writeToDisplay()
    }
    
    @IBAction func five(sender: AnyObject) {
        
        displayText.append(5)
        writeToDisplay()
    }
    
    @IBAction func six(sender: AnyObject) {
        
        displayText.append(6)
        writeToDisplay()
    }
    
    @IBAction func seven(sender: AnyObject) {
        
        displayText.append(7)
        writeToDisplay()
    }
    
    @IBAction func eight(sender: AnyObject) {
        
        displayText.append(8)
        writeToDisplay()
    }
    
    @IBAction func nine(sender: AnyObject) {
        
        displayText.append(9)
        writeToDisplay()
    }
    
    
    
    func writeToDisplay() {
        
        var textToDisplay = ""
        
        for (var i = 0; i < displayText.count; i++) {
            
            textToDisplay = " \(textToDisplay)" + "\(displayText[i])"
        }
        
        display.text = textToDisplay
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

