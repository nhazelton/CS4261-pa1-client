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
    
    struct Response: Codable {
        let userId: Int
        let id: Int
        let title: String
        let completed: Bool
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataButtonAction(_ sender: UIButton) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(Response.self, from: data)
                    print(json.title)
                } catch {
                    print ("Something went wrong")
                }
            }
        }
        
        task.resume()
    }
}

