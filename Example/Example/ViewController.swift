//
//  ViewController.swift
//  Example
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import UIKit
import FSNetworkManager

class ViewController: UIViewController {
    
    var networkManager: RequestProtocol = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //GET Request
        networkManager.sendGetRequest("URLString", params: [:], headers: [:]) { (data, response, error, request) in
            // Your Code come here
            
        }
        
        //POST Request
        networkManager.sendRequest(method: .POST, "URLString", body: [:], headers: [:], params: [:]) { (data, response, error, request) in
            // Your Code come here

        }
        
    }
}

