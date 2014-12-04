//
//  ViewController.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/6/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myDriver = Driver()
        myDriver.startEngine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

