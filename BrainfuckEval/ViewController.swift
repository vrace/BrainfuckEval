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
    
    @IBAction func clearButtonClick(sender: UIButton) {
        sourceView.text = ""
    }

    @IBAction func runButtonClick(sender: UIButton) {
        resultView.text = ""
        
        var vm = BrainfuckVM(io: self, source: sourceView.text)
        vm.run()
    }
    
    func write(char: Character) {
        resultView.text = resultView.text.stringByAppendingString(String(char))
    }
}

