
//
//  ViewController.swift
//  ebike
//
//  Created by Stephen Sizensky on 12/20/16.
//  Copyright © 2016 Stephen Sizensky. All rights reserved.
//

import UIKit
import Firebase


class TheNextViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var memberIDField: UITextField!

   
    @IBOutlet weak var passwordField: UITextField!
  
    
    
    var firebase: FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firebase = FIRDatabase.database().reference()
        
        if let user = FIRAuth.auth()?.currentUser {
            self.firebase!.child("users/\(user.uid)/userID").setValue(user.uid)
        } else {
            FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.firebase!.child("users").child(user!.uid).setValue(["userID": user!.uid])
                }
                
            })
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)    }

    
    @IBAction func login(_ sender: Any) {

        guard let email = self.memberIDField.text else { return }
        guard let password = self.passwordField.text else { return }
        
        if email != "" && password != "" {
            let credential = FIREmailPasswordAuthProvider.credential(withEmail: email, password: password)
            
            FIRAuth.auth()?.currentUser?.link(with: credential, completion: { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.firebase!.child("users/\(user!.uid)/email").setValue(user!.email!)
                }
            })
            
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Please enter a Member ID and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Hide the keyboard when user touches outside keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
}


