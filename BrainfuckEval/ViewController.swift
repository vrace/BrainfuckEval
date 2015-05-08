//
//  ViewController.swift
//  BrainfuckEval
//
//  Created by Liu Yang on 5/8/15.
//  Copyright (c) 2015 Liu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BrainfuckIO {
    
    @IBOutlet weak var sourceView: UITextView!
    @IBOutlet weak var resultView: UITextView!
    
    var vm: BrainfuckVM!
    
    @IBAction func clearButtonClick(sender: UIButton) {
        sourceView.text = ""
    }
    
    @IBAction func runButtonClick(sender: UIButton) {
        
        sourceView.resignFirstResponder()
        
        resultView.text = ""
        
        if vm == nil
        {
            vm = BrainfuckVM(io: self)
        }
        
        if vm.load(sourceView.text)
        {
            vm.run()
        }
        else
        {
            let alert = UIAlertView(title: "Error", message: "Code won't compile", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
        }
    }
    
    func write(char: Character) {
        resultView.text = resultView.text.stringByAppendingString(String(char))
    }
}

