//
//  MaskView.swift
//  Example-LayerMask
//
//  Created by Yuchen Zhong on 2017-04-30.
//  Copyright © 2017 Yuchen Zhong. All rights reserved.
//

import Foundation
import UIKit

private extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

@IBDesignable class MaskView: UIView {
    let startAngle: CGFloat = 180
    let endAngle: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // The multipler determine how big the circle is
        let multipler: CGFloat = 3.0
        let radius: CGFloat = frame.size.width * multipler
        let maskLayer = CAShapeLayer()
        let arcCenter = CGPoint(x: frame.size.width / 2, y: radius)
        maskLayer.path = UIBezierPath(arcCenter: arcCenter,
                                      radius: radius,
                                      startAngle: startAngle.degreesToRadians,
                                      endAngle: endAngle.degreesToRadians,
                                      clockwise: true).cgPath
        layer.mask = maskLayer
    }
}
