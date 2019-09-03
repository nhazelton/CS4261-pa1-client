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
        let url = URL(string: "https://postman-echo.com/get?text=hey")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}

