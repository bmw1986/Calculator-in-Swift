//
//  ViewController.swift
//  Calculator
//
//  Created by Freddy Oakes on 2/22/15.
//  Copyright (c) 2015 The Hofmeister Kink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    var rawNum = [Int]()            // array for raw numbers for which calculations will be performed on
    var firNum = 1                  // first number to be calculated on
    var secNum = 0                  // second number to be calculated on
    var add = false                 // bools are for the different opperators
    var sub = false                 // '' ''
    var mul = false                 // '' ''
    var div = false                 // '' ''
    var firNumFlag = 1              // if first number entered then 1 otherwise 0
    var displayText = ""            // To be displayed on "screen"
    var i = 0
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func clear(sender: AnyObject) { clearEverything() }
    @IBAction func backspace(sender: AnyObject) {   }
    @IBAction func enter(sender: AnyObject) {   }
    
    @IBAction func add(sender: AnyObject)      { doWeCalcYet(1) }
    @IBAction func subtract(sender: AnyObject) { doWeCalcYet(2) }
    @IBAction func multiply(sender: AnyObject) { doWeCalcYet(3) }
    @IBAction func divide(sender: AnyObject)   { doWeCalcYet(4) }
    
    @IBAction func zero(sender: AnyObject)      { append_rawNum(0) }
    @IBAction func one(sender: AnyObject)       { append_rawNum(1) }
    @IBAction func two(sender: AnyObject)       { append_rawNum(2) }
    @IBAction func three(sender: AnyObject)     { append_rawNum(3) }
    @IBAction func four(sender: AnyObject)      { append_rawNum(4) }
    @IBAction func five(sender: AnyObject)      { append_rawNum(5) }
    @IBAction func six(sender: AnyObject)       { append_rawNum(6) }
    @IBAction func seven(sender: AnyObject)     { append_rawNum(7) }
    @IBAction func eight(sender: AnyObject)     { append_rawNum(8) }
    @IBAction func nine(sender: AnyObject)      { append_rawNum(9) }
    @IBAction func decimal(sender: AnyObject)   { append_rawNum(0) }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func isValid(opp: Bool, data: String) {
        // Determines if the button pushed is valid
    }
    
    func calculate() {
        // checks to see what opp is true
        // puts current value into secNum
        // performs calculation
        // displays result
        // puts result into firNum
        // clears the opps
    }
    
    func clear_rawNum() {
        // clears the value of rawNum
        // rawNum = []
    }
    
    func append_rawNum(num: Int) {
        var myString = ""
        rawNum.append(num)
        myString = String(num)
        writeToDisplay(myString)
    }
    
    func setOpp(opp: Int) {
        // set bool to opperator pressed
        // put current rawNum into either firNum or secNum
        // sets all other opps to false
    }
    
    func clearOpps() {
        add = false
        sub = false
        mul = false
        div = false
    }
    
    func doWeCalcYet(opp: Int) {
        // Desides if we already have a opp set to true
        // if we do then do calculation
        // else set the opp to true eith setOpp func
        storeNum()
    }
    
    func clearEverything() {
        displayText = ""
        writeToDisplay("")
    }
    
    func storeNum() {
        let rawInt = 0
        var finalInt = 0
        var rawString = ""
        var finalString = ""
        
        if (firNumFlag == 1) {
            for (var i=0; i < rawNum.count; i++) {
                rawNum[i] = rawInt
                rawString = String(rawInt)
                finalString += rawString
                print("rawNum[i] is:")
                print(rawNum[i])
            }
            finalInt = Int(rawString)!
            firNum = finalInt
            print("This is firNum: ")
            print(firNum)
            firNumFlag = 0
        } else {
            for (var i=0; i < rawNum.count; i++) {
                rawNum[i] = rawInt
                rawString = String(rawInt)
                finalString += rawString
                print("rawNum[i] is:")
                print(rawNum[i])
            }
            finalInt = Int(rawString)!
            secNum = finalInt
            print("This is secNum: ")
            print(secNum)
        }
    }
    
    func writeToDisplay(valueToAdd: String) {
        displayText += valueToAdd
        display.text = displayText
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