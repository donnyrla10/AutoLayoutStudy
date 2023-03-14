//
//  ViewController.swift
//  CustomSwitch
//
//  Created by 김영선 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var switchConstant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = 25
        switchBG.layer.cornerRadius = 25
    }

    @IBAction func tapSwitchButton(_ sender: UIButton) {
        switchConstant.constant = -switchConstant.constant
        if switchConstant.constant == -75 {
            let color: UIColor = #colorLiteral(red: 0.5331768394, green: 0.643659234, blue: 1, alpha: 1)
            switchBG.backgroundColor = color
        }else {
            switchBG.backgroundColor = .systemGray2
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

