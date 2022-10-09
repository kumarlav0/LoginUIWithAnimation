//
//  LoginScrollViewController.swift
//  LoginDemo
//
//  Created by Kumar Lav on 12/13/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import TransitionButton

class LoginVC: UIViewController {
    
    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var signInButton: TransitionButton!
    @IBOutlet weak var signInGoogleButton: UIButton!
    @IBOutlet weak var secureTextButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!

    var isCurved = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(isCorner: true)
        hideKeyboardWhenTappedAround()
    }



    override func viewDidAppear(_ animated: Bool) {
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.2274509804, blue: 0.1803921569, alpha: 1)
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
    }
    
    func setCornerRadius(isCorner:Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            if isCorner {
                self.signInButton.round()
                self.signInGoogleButton.round()
                self.LoginView.layer.cornerRadius = 40.0

            } else {
                self.signInButton.layer.cornerRadius = 0.0
                self.signInGoogleButton.layer.cornerRadius = 0.0
                self.LoginView.layer.cornerRadius = 0.0
            }
            self.LoginView.setShadow()
            self.signInGoogleButton.layer.borderColor = #colorLiteral(red: 0.1147934226, green: 0.2276530774, blue: 0.1814977513, alpha: 1)
            self.signInGoogleButton.layer.borderWidth = 2.0
        }

    }
    
    
    @IBAction func signInAction(_ sender: UIButton) {
        // self.setCornerRadius(isCorner: false)
        spinButton()
    }
    
    
    @IBAction func signInWithGoogleAction(_ sender: UIButton) {
        setCornerRadius(isCorner: isCurved ? false : true )
        isCurved = !isCurved
    }
    
    
    @IBAction func gotoRegistrationAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        present(vc, animated: true, completion: nil)
    }

    @IBAction func forgotPasswordAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        present(vc, animated: true, completion: nil)
    }


    @IBAction func secureTextAction(_ sender: UIButton) {
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = true
            secureTextButton.setImage(#imageLiteral(resourceName: "invisible"), for: .normal)
            sender.isSelected = false
        } else {
            passwordTextField.isSecureTextEntry = false
            secureTextButton.setImage(#imageLiteral(resourceName: "visibility-button"), for: .normal)
            sender.isSelected = true
        }
    }
    
    
    func spinButton()
    {
        signInButton.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async {
            // Do your networking task or background work here.
            DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                guard let self = self else { return }
                self.signInButton.stopAnimation(animationStyle: .expand) {
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else { return }
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
}

