//
//  ForgotPasswordVC.swift
//  LoginDemo
//
//  Created by apple on 22/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    
    @IBOutlet weak var forgotPasswordView: UIView!
    
    @IBOutlet weak var resetNowButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         forgotPasswordView.setShadow()
         forgotPasswordView.layer.cornerRadius = 40.0
        resetNowButton.layer.cornerRadius = resetNowButton.frame.height / 2
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetNowAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
                 self.present(vc, animated: true, completion: nil)
    }
    
}
