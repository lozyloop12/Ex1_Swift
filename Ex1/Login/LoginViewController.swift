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
    fileprivate var aView: UIView?
    
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func showSpinner(){
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai=UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        if ((aView?.center) != nil){
            ai.center = aView?.center as! CGPoint
        }
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
     func removeSpinner(){
        aView?.removeFromSuperview()
        aView = nil
    }
    
    @IBAction func login(_ sender: Any) {
        self.showSpinner()
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
                        self.removeSpinner()
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
