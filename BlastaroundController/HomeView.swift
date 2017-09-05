//
//  HomeView.swift
//  test0
//
//  Created by Stephen Sizensky on 1/6/17.
//  Copyright © 2017 Stephen Sizensky. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase

class HomeView: UIViewController {
    @IBAction func onButton(_ sender: Any) {
         onButton1(state: "launchedUserLoggedIn")
        
        
        
        
        
        
    }
    @IBAction func offButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onButton1(state: "launchedUserLoggedIn")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onButton1(state: String) {
        let ref = FIRDatabase.database().reference()
        let post : [String: AnyObject] = ["state": state as AnyObject]
        ref.child("onButton1").setValue(post)
        
    
    
    
}

}
