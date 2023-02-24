//
//  ViewController.swift
//  FloatingButton
//
//  Created by 김영선 on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopUp" {
            let floatingVC = segue.destination as! FloatingButtonViewController //업캐스팅
            floatingVC.modalPresentationStyle = .overFullScreen
        }
    }
}

