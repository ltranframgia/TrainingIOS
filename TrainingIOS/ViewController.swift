//
//  ViewController.swift
//  TrainingIOS
//
//  Created by mod bibi on 7/18/17.
//  Copyright © 2017 DaoNhat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    

    @IBAction func btnLoginSubmit(_ sender: Any) {
        let email:String = txtEmail.text!
        let password:String = txtPassword.text!
        let messageErrors:UIAlertController = UIAlertController(title: "Notification"
            , message: "Login failed. Please check your email or password", preferredStyle: UIAlertControllerStyle.alert)
        let btnOK:UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        messageErrors.addAction(btnOK)
        let mainscr = storyboard?.instantiateViewController(withIdentifier: "mainscr") as! MainController
        
        if !isValidEmail(testStr:email) || password.characters.count < 6 {
            present(messageErrors, animated: true, completion: nil)
        }else{
            print("switch screen")
            present(mainscr, animated: true, completion: nil)
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.layer.borderColor = UIColor.white.cgColor
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.cornerRadius = 25

        txtPassword.layer.borderColor = UIColor.white.cgColor
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.cornerRadius = 25

        btnLogin.layer.cornerRadius = 25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

