//
//  ViewController.swift
//  GraphLayout
//
//  Created by 김영선 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var graphHeight1: NSLayoutConstraint!
    @IBOutlet weak var graphHeight2: NSLayoutConstraint!
    @IBOutlet weak var graphHeight3: NSLayoutConstraint!
    @IBOutlet weak var graphHeight4: NSLayoutConstraint!
    @IBOutlet weak var graphHeight5: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapStyle1(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.graphHeight1 = self.graphHeight1.changeMultiplier(value: 0.9)
            self.graphHeight2 = self.graphHeight2.changeMultiplier(value: 0.8)
            self.graphHeight3 = self.graphHeight3.changeMultiplier(value: 0.7)
            self.graphHeight4 = self.graphHeight4.changeMultiplier(value: 0.6)
            self.graphHeight5 = self.graphHeight5.changeMultiplier(value: 0.5)
            self.view.layoutIfNeeded() // 화면 갱신 -> animate 안에 있으므로 0.5초마다 화면 갱신
        }
    }
    
    @IBAction func tapStyle2(_ sender: UIButton) {
        graphHeight1 = graphHeight1.changeMultiplier(value: 0.5)
        graphHeight2 = graphHeight2.changeMultiplier(value: 0.6)
        graphHeight3 = graphHeight3.changeMultiplier(value: 0.7)
        graphHeight4 = graphHeight4.changeMultiplier(value: 0.8)
        graphHeight5 = graphHeight5.changeMultiplier(value: 0.9)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        //이전 constraints 없애기 -> 없으면 원래 있던 값에 누적된다! -> 원하는 값 나오지 않음
        NSLayoutConstraint.deactivate([self])
        
        //item: first item, toItem: second item
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        //새로 만든거 넣기
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
