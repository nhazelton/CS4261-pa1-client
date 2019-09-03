//
//  ViewController.swift
//  CS4261-pa1-client
//
//  Created by Nate Hazelton on 9/3/19.
//  Copyright © 2019 Nate Hazelton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getDataButtonAction(_ sender: UIButton) {
        dataLabel.text = "Got something cool"
    }
}

