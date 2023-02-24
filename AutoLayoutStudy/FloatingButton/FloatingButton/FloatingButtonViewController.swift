//
//  FloatingButtonViewController.swift
//  FloatingButton
//
//  Created by 김영선 on 2023/02/24.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    @IBOutlet weak var btn1Y: NSLayoutConstraint!
    @IBOutlet weak var btn2Y: NSLayoutConstraint!
    @IBOutlet weak var btn3Y: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1Y.constant = 0
        btn2Y.constant = 0
        btn3Y.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.btn1Y.constant = 80
            self.btn2Y.constant = 160
            self.btn3Y.constant = 240
            
            //화면 갱신
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btn1Y.constant = 0
            self.btn2Y.constant = 0
            self.btn3Y.constant = 0
            
            //화면 갱신
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false)
        }
    }
}
