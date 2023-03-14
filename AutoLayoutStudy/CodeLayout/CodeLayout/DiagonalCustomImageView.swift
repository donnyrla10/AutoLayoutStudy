//
//  DiagonalCustomImageView.swift
//  CodeLayout
//
//  Created by 김영선 on 2023/03/14.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {
    @IBInspectable var innerHeight : CGFloat = 0
    
    override func layoutSubviews() {
        makeMask()
    }
    
    //도형 만들기 -> path
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        //시작점 정하기
        path.move(to: CGPoint.init(x: 0, y: 0)) //CGPoint.zero
        //그리기
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        //그리기 끝내기 -> 연결
        path.close()
        return path
    }
    
    //path -> Layer 만들기
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    //layer로 이미지 마스킹하기
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
}
