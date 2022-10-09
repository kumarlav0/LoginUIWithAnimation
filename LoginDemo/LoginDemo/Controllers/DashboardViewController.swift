//
//  DashboardViewController.swift
//  LoginDemo
//
//  Created by Kumar Lav on 09/10/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var pendulamView: UIView!
    @IBOutlet weak var spinView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        spinView.round()
        pendulamView.round()
        pendulamView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateViews()
        spin()
    }

    func animateViews() {
        UIView.animate(withDuration: 1.4, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.spinView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

        })
    }

    func spin() {
        UIView.animate(withDuration: 2.8, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.pendulamView.rotate(angle: 180)
        })
    }

}

// MARK: - UIView Extension
extension UIView {

    /**
     Rotate a view by specified degrees
     parameter angle: angle in degrees
     */

    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }

    func round() {
        layer.cornerRadius = layer.frame.height/2
    }

}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
