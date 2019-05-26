//
//  SignUpVC.swift
//  Opia
//
//  Created by Willie Fatimehin on 5/26/19.
//  Copyright © 2019 Opia. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        if password.text != passwordConfirm.text {
            
            let alertController = UIAlertController(title: "Incorrect Password", message: "Please re-type your password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
                    }
        
        else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                
                if error == nil {
                    self.performSegue(withIdentifier: "toDreamRecord", sender: self)
                }
                
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                
                }
                    }
            }
    
  
    }
}
