//
//  PopUpViewController.swift
//  PopUpLayout
//
//  Created by 김영선 on 2023/03/15.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelPopUp(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
