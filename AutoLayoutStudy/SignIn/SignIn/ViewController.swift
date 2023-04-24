//
//  ViewController.swift
//  SignIn
//
//  Created by 김영선 on 2023/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordErrorMessage: UILabel!
    @IBOutlet weak var emailErrorMessage: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var emailErrorHeight : NSLayoutConstraint!
    var passwordErrorHeight : NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        //textField 값이 변경되는 것을 캐치하는 기능 추가
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        emailErrorHeight = emailErrorMessage.heightAnchor.constraint(equalToConstant: 0) //값설정
        passwordErrorHeight = passwordErrorMessage.heightAnchor.constraint(equalToConstant: 0) //값설정
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        if textField == emailTextField {
            if isValidEmail(email: textField.text) {
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
        }else if textField == passwordTextField {
            if isValidPassword(pw: textField.text) {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()//duration만큼 계속 갱신
        }
    }
    
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false } //guard문으로 nil 값 걸러주기(optional binding)
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email) //true or false 반환
    }
    
    func isValidPassword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8 { return false }
        }
        return true

    }
}

