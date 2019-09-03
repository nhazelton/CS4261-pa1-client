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
        let url = URL(string: "https://6h22lym61k.execute-api.us-east-1.amazonaws.com/example")!
        let parameters = ["exampleString": "hey"]
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }

        let task = session.dataTask(with: request) {(data, response, error) in
            guard error == nil else { 
                completion(nil, error)
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}

