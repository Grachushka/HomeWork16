//
//  ViewController.swift
//  HomeWork16
//
//  Created by Pavel Procenko on 03/09/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

struct User {
    
    var login: String
    var password: String
    
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textViewLogin: UITextField!
    @IBOutlet weak var password: UILabel!
 
    @IBOutlet weak var textViewPassword: UITextField!
    @IBOutlet weak var login: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = getCurrentUser()
        textViewLogin.text = s.login
        textViewPassword.text = s.password
        
    }

    @IBAction func clear(_ sender: Any) {
        
        
        textViewLogin.text = nil
        textViewPassword.text = nil
        
        print("clear: " , textViewLogin.text!, textViewPassword.text!)
        
    }
    
    @IBAction func save(_ sender: Any) {
   
            let login = textViewLogin.text
            let password = textViewPassword.text
        
            UserDefaults.standard.setValue(login, forKey: "login")
            UserDefaults.standard.setValue(password, forKey: "password")
        
        
    }
    
    
    func getCurrentUser() -> User {
       
        guard let login = UserDefaults.standard.value(forKey: "login") as? String
            else {
            
            return User(login: " ", password: " ")
                
        }
        guard let password = UserDefaults.standard.value(forKey: "password") as?
            String
            
            else {
            
            return User(login: " ", password: " ")
        }
        print("current login: \(login) current pass: \(password)")

        return User(login: login, password: password)
    }
}


    


