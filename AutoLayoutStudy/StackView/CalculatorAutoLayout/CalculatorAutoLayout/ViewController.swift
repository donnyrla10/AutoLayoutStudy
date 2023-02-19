//
//  ViewController.swift
//  CalculatorAutoLayout
//
//  Created by 김영선 on 2023/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var mul: UIButton!
    @IBOutlet weak var sub: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var plus_minus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AC.layer.cornerRadius = AC.bounds.width / 2
        plus_minus.layer.cornerRadius = plus_minus.bounds.width / 2
        percent.layer.cornerRadius = percent.bounds.width / 2
        divide.layer.cornerRadius = divide.bounds.width / 2
        seven.layer.cornerRadius = seven.bounds.width / 2
        six.layer.cornerRadius = six.bounds.width / 2
        eight.layer.cornerRadius = eight.bounds.width / 2
        nine.layer.cornerRadius = nine.bounds.width / 2
        five.layer.cornerRadius = five.bounds.width / 2
        four.layer.cornerRadius = four.bounds.width / 2
        three.layer.cornerRadius = three.bounds.width / 2
        two.layer.cornerRadius = two.bounds.width / 2
        one.layer.cornerRadius = one.bounds.width / 2
        zero.layer.cornerRadius = zero.bounds.height / 2
        dot.layer.cornerRadius = dot.bounds.width / 2
        plus.layer.cornerRadius = plus.bounds.width / 2
        sub.layer.cornerRadius = sub.bounds.width / 2
        mul.layer.cornerRadius = mul.bounds.width / 2
        equal.layer.cornerRadius = equal.bounds.width / 2
    }

}

