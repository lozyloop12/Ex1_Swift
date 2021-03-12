//
//  LoginViewController.swift
//  Ex1
//
//  Created by LozyLoop on 16/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
     @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {

        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        //account success: Aaaa12@gmail.com/11111111
        let params = Login(email: email, password: password)
        Helper.login(params: params,
                     callback: {
            let inviteController = InviteViewController()
                        self.navigationController?.pushViewController(inviteController, animated: true)}
        )

    }
    private func setUpUI(){
        passwordTextField.isSecureTextEntry = true
        loginButton.layer.cornerRadius = 15
    }
    private func setupNavigation(){
        title = "Login"
    }

    
    @IBAction func edit(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
