//
//  ViewController.swift
//  BrainfuckEval
//
//  Created by Liu Yang on 5/8/15.
//  Copyright (c) 2015 Liu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sourceView: UITextView!
    @IBOutlet weak var resultView: UITextView!
    
    @IBAction func clearButtonClick(sender: UIButton) {
        sourceView.text = ""
    }

    @IBAction func runButtonClick(sender: UIButton) {
    }
}

