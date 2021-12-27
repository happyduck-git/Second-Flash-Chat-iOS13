//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet var errorMessageLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text,let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error { //error가 있는 경우
                    self.errorMessageLabel.text = e.localizedDescription
                } else { //에러가 없는 경우, 성공적으로 가입 정보가 입력된 경우, ChatViewController로 이동시킨다.
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    
                }
            }
        }
        
        
    }
    
}
