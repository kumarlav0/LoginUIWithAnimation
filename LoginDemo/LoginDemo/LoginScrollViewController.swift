//
//  LoginScrollViewController.swift
//  LoginDemo
//
//  Created by Kumar Lav on 12/13/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
       @IBOutlet weak var LoginView: UIView!
       @IBOutlet weak var signInButton: UIButton!
       @IBOutlet weak var signInGoogleButton: UIButton!
       @IBOutlet weak var secureTextButton: UIButton!
       @IBOutlet weak var passwordTextField: UITextField!
    
       
       override func viewDidLoad() {
           super.viewDidLoad()
           self.setCornerRadius(isCorner: true)
       }



    override func viewDidAppear(_ animated: Bool) {
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.2274509804, blue: 0.1803921569, alpha: 1)
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
    }
    
    func setCornerRadius(isCorner:Bool)
    {
        if isCorner{
             signInButton.layer.cornerRadius = signInButton.frame.height / 2
             signInGoogleButton.layer.cornerRadius = signInGoogleButton.frame.height / 2
             LoginView.layer.cornerRadius = 40.0
             
        }
        else{
            signInButton.layer.cornerRadius = 0.0
            signInGoogleButton.layer.cornerRadius = 0.0
            LoginView.layer.cornerRadius = 0.0
        }
           LoginView.setShadow()
           signInGoogleButton.layer.borderColor = #colorLiteral(red: 0.1147934226, green: 0.2276530774, blue: 0.1814977513, alpha: 1)
           signInGoogleButton.layer.borderWidth = 2.0
    }
    
    
    @IBAction func signInAction(_ sender: UIButton) {
            self.setCornerRadius(isCorner: false)
    }
    
    
    @IBAction func signInWithGoogleAction(_ sender: Any) {
          self.setCornerRadius(isCorner: true)
    }
    
    
       @IBAction func gotoRegistrationAction(_ sender: Any) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
           self.present(vc, animated: true, completion: nil)
       }
       
       @IBAction func forgotPasswordAction(_ sender: Any) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
           self.present(vc, animated: true, completion: nil)
       }
       
   
    @IBAction func secureTextAction(_ sender: UIButton) {
        if sender.isSelected{
            self.passwordTextField.isSecureTextEntry = true
            self.secureTextButton.setImage(#imageLiteral(resourceName: "invisible"), for: .normal)
            sender.isSelected = false
        }
        else{
             self.passwordTextField.isSecureTextEntry = false
             self.secureTextButton.setImage(#imageLiteral(resourceName: "visibility-button"), for: .normal)
             sender.isSelected = true
        }
    }
    
}
