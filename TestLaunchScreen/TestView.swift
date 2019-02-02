//
//  TestView.swift
//  TestLaunchScreen
//
//  Created by punyawee  on 21/1/2562 BE.
//  Copyright © 2562 Punyugi. All rights reserved.
//

import UIKit

class TestView: UIView {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
    override func draw(_ rect: CGRect) {
        let redColor = UIColor.red
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        rectanglePath.stroke()
        redColor.set()
        rectanglePath.fill()
    }


}
