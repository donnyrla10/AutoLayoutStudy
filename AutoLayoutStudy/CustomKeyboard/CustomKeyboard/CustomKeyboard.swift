//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by 김영선 on 2023/02/21.
//

import UIKit

//CustomKeyboard에서 위임할 기능 선언
protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    //protocol이 사용될 수 있도록 연결해주는 개념
    var delegate: CustomKeyboardDelegate? //optional 타입 -> 왜? 연결이 끊어지지 않고 오브젝트가 남아있어서 메모리 누수가 발생할 수 있음
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        delegate?.keyboardTapped(str: title) //ViewController의 keyboardTapped()메소드 호출
    }
}
