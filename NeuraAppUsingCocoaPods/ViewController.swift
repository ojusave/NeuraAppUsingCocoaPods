//
//  ViewController.swift
//  NeuraAppUsingCocoaPods
//
//  Created by Ojus Save on 1/25/17.
//  Copyright © 2017 Neura. All rights reserved.
//

import UIKit
import NeuraSDK

class ViewController: UIViewController {
    
    let nSDK = NeuraSDK.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func subscribeToEvents1(){
        NeuraSDK.sharedInstance().subscribe(toEvent: "presenceAtHome", identifier: ("_presenceAtHome"), webHookID: nil) { (responseData, error) in
            if error != nil {
                print(error!)
                //Handle the error subscribing
            }
        }
    }
    func loginToNeura(){
        let permissions: Array = ["presenceAtHome"]
        
        NeuraSDK.sharedInstance().authenticate(withPermissions: permissions as [String], userInfo: nil, on: self, withHandler: { (token, error) in
            if (token != nil && error == nil) {
                //Handle post-login actions
            } else {
                //Handle error
            }
        })
    }

    
    @IBAction func SubscribeToEvents(_ sender: Any) {
        subscribeToEvents1()
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        loginToNeura()
    }

}

