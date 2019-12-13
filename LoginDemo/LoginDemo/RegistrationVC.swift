//
//  RegisterViewController.swift
//  LoginDemo
//
//  Created by apple on 22/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var registrationView: UIView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var securePassTextButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var secureConPassTextButton: UIButton!
    @IBOutlet weak var ConPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registrationView.setShadow()
        registrationView.layer.cornerRadius = 40.0
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func securePasswordTextAction(_ sender: UIButton) {
        if sender.isSelected{
            self.passwordTextField.isSecureTextEntry = true
            self.securePassTextButton.setImage(#imageLiteral(resourceName: "invisible"), for: .normal)
            sender.isSelected = false
        }
        else{
             self.passwordTextField.isSecureTextEntry = false
             self.securePassTextButton.setImage(#imageLiteral(resourceName: "visibility-button"), for: .normal)
             sender.isSelected = true
        }
    }
    
    @IBAction func secureConPasswordTextAction(_ sender: UIButton) {
          if sender.isSelected{
              self.ConPasswordTextField.isSecureTextEntry = true
              self.secureConPassTextButton.setImage(#imageLiteral(resourceName: "invisible"), for: .normal)
              sender.isSelected = false
          }
          else{
               self.ConPasswordTextField.isSecureTextEntry = false
               self.secureConPassTextButton.setImage(#imageLiteral(resourceName: "visibility-button"), for: .normal)
               sender.isSelected = true
          }
      }
    
    
}
