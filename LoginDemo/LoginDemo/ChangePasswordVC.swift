//
//  ChangePasswordVC.swift
//  LoginDemo
//
//  Created by apple on 22/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    
    @IBOutlet weak var changePasswordView: UIView!
    
    @IBOutlet weak var changeNowButton: UIButton!
    
    @IBOutlet weak var securePassTextButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
       
    @IBOutlet weak var secureConPassTextButton: UIButton!
    @IBOutlet weak var ConPasswordTextField: UITextField!
    
    @IBOutlet weak var secureOldPassTextButton: UIButton!
    @IBOutlet weak var OldPasswordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePasswordView.layer.cornerRadius = 40.0
        changeNowButton.layer.cornerRadius = changeNowButton.frame.height / 2
        changePasswordView.setShadow()

    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    func checkSpelling(word:String) -> Bool
    {
        let word = "Monday"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allgood =  misspelledRange.location == NSNotFound
        
        print("allgood: \(allgood)")
        
        return allgood
    }
    
    
}
