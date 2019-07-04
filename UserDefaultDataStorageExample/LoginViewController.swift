//
//  ViewController.swift
//  UserDefaultDataStorageExample
//
//  Created by moxDroid on 2019-07-04.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getRememberMeValues()
        print("HELLO-viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         print("HELLO-viewWillAppear")
    }
    
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtEmailID.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
        }
    }

    @IBAction func btnLoginPressed(_ sender: UIButton)
    {
        if self.txtEmailID.text == "admin@gmail.com" && self.txtPassword.text == "s3cr3t"
        {
            let userDefault = UserDefaults.standard
            if switchRememberMe.isOn
            {
                
                userDefault.setValue(txtEmailID.text, forKey: "userEmail")
                userDefault.set(txtPassword.text, forKey: "userPassword")
            }
            else
            {
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
            }
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Try again, User Email / Password Invalid", preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okButton)
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        print("Logout")
        let s = storyboardSegue.source as! WelcomeViewController
        print(s.lblWelcome.text!)
        
        txtPassword.text = ""
        txtEmailID.text = ""
    }
    
    
    
}

