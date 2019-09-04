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
    @IBOutlet weak var dataField: UITextField!
    
    var semaphore = DispatchSemaphore(value: 0)
    
    struct Response: Codable {
        let message: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataButtonAction(_ sender: UIButton) {
        var newLabel: String? = nil
        
        let url = URL(string: "https://6h22lym61k.execute-api.us-east-1.amazonaws.com/dev/example")!
        let parameters = ["exampleString": dataField.text]
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        let task = session.dataTask(with: request) {(data, response, error) in
            guard error == nil else { 
                return
            }
            
            guard let data = data else { return }
            let dataString = String(data: data, encoding: .utf8)!
            newLabel = String(dataString.dropFirst(12))
            self.semaphore.signal()
        }

        task.resume()
        
        semaphore.wait(timeout: .now() + 5.0) // 5 sec timeout
        dataLabel.text = newLabel
    }
}

