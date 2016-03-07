//
//  ViewController.swift
//  DianXinHUD
//
//  Created by wangtian on 16/3/7.
//  Copyright © 2016年 wangtian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //DXHUD.showHud(inView: self.view)
        let view = UIView.init(frame: CGRectMake(100, 100, 5, 5))
        view.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(view)
        let shape = CAShapeLayer()
        let arcPath = UIBezierPath.init(arcCenter: CGPointMake(300, 200), radius: 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        shape.path = arcPath.CGPath
        shape.lineWidth = 4
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.greenColor().CGColor
        self.view.layer.addSublayer(shape)
        
        
        let layer = CALayer()
        layer.frame = CGRectMake(100, 100, 50, 50)
        layer.backgroundColor = UIColor.greenColor().CGColor
        self.view.layer.addSublayer(layer)
        
        let rotaionAnimation = CABasicAnimation.init(keyPath: "affineTransform")
        rotaionAnimation.toValue = NSValue.init(CGAffineTransform:CGAffineTransformMakeRotation(CGFloat(M_PI)))
        rotaionAnimation.duration = 3
        rotaionAnimation.repeatCount = MAXFLOAT
        //        rotaionAnimation.calculationMode = kCAAnimationPaced
        //        rotaionAnimation.rotationMode = kCAAnimationRotateAuto
        shape.addAnimation(rotaionAnimation, forKey: "rotaion")
        
        layer.addAnimation(rotaionAnimation, forKey: "rotaion1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

