//
//  LoginViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 01/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as? HomeViewController
//    }
    
    @IBAction func loginButtinClicked(_ sender: Any) {
        if usernameText.text == "test", passwordText.text == "1234" {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.usernameText.resignFirstResponder()
//        self.passwordText.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
