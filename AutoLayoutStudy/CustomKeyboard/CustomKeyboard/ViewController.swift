//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by 김영선 on 2023/02/21.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
    @IBOutlet weak var customTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //custom keyboard view 설정
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self //mykeybordView(CustomKeyBoard)의 delegate를 ViewController(self)에 위임하겠다
        //custom keyboard view를 만들면 아래의 한줄로 연결할 수 있다
        customTextField.inputView = myKeyboardView
    }
    
    //CustomKeyboard의 tapButton() -> Action 메소드의 이벤트가 발생(키보드 버튼 탭)하면 호출된다
    func keyboardTapped(str: String) {
        let current = customTextField.text!
        if current.isEmpty { //값이 없다면
            customTextField.text = str
        }else {
            customTextField.text = current + str
        }
    }
}
