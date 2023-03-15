//
//  ViewController.swift
//  PopUpLayout
//
//  Created by 김영선 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopUp(_ sender: UIButton) {
        //popupviewcontroller가 나와야 한다! 화면 전환
        let popup = UIStoryboard.init(name: "PopUpViewController", bundle: nil).instantiateViewController(withIdentifier: "popupID")
        popup.modalPresentationStyle = .overCurrentContext
        self.present(popup, animated: false)
    }
    
}

