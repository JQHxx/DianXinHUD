//
//  DXHUD.swift
//  DianXinHUD
//
//  Created by wangtian on 16/3/7.
//  Copyright © 2016年 wangtian. All rights reserved.
//

import UIKit

class DXHUD: UIView {
    
    @IBOutlet weak var logoView: UIImageView!
    lazy var arcLayer = CAShapeLayer()
    
    class func dxHud() -> (DXHUD)
    {
        //从xib加载view
        let hud = NSBundle.mainBundle().loadNibNamed("DXHUD", owner: nil, options: nil).first as! DXHUD
        //创建logo上的圆弧
        let arcPath = UIBezierPath.init(arcCenter: hud.logoView.center, radius: hud.logoView.frame.size.width / 2, startAngle: 0, endAngle: CGFloat(M_PI / 4), clockwise: true)
        hud.arcLayer.path = arcPath.CGPath
        hud.arcLayer.lineWidth = 4
        hud.arcLayer.strokeColor = UIColor.redColor().CGColor
        //将圆弧添加到layer上
        hud.layer.addSublayer(hud.arcLayer)
        return hud
    }
    
    func beginAnimation()
    {
        let rotaionAnimation = CAKeyframeAnimation.init(keyPath: "position")
        let arcPath = CGPathCreateWithEllipseInRect(CGRectMake(0, 0, 25, 25), nil)
        rotaionAnimation.path = arcPath
        rotaionAnimation.duration = 3
        rotaionAnimation.additive = true
        rotaionAnimation.repeatCount = MAXFLOAT
        rotaionAnimation.calculationMode = kCAAnimationPaced
        rotaionAnimation.rotationMode = kCAAnimationRotateAuto
        self.arcLayer.addAnimation(rotaionAnimation, forKey: "rotaion")
        
        
//        let rotaionAnimation = CABasicAnimation.init(keyPath: "transform")
//        rotaionAnimation.toValue = NSValue.init(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1))
//        rotaionAnimation.duration = 10
//        rotaionAnimation.repeatCount = MAXFLOAT
////        rotaionAnimation.calculationMode = kCAAnimationPaced
////        rotaionAnimation.rotationMode = kCAAnimationRotateAuto
//        self.arcLayer.addAnimation(rotaionAnimation, forKey: "rotaion")
        
        
//        let rotaionAnimation = CABasicAnimation.init(keyPath: "position.x")
//        rotaionAnimation.toValue = NSNumber.init(float: 30)
//        rotaionAnimation.duration = 3
//        rotaionAnimation.additive = true
//        rotaionAnimation.repeatCount = MAXFLOAT
//        //        rotaionAnimation.calculationMode = kCAAnimationPaced
//        //        rotaionAnimation.rotationMode = kCAAnimationRotateAuto
//        self.arcLayer.addAnimation(rotaionAnimation, forKey: "rotaion")
    }
    
    func endAnimation()
    {
        self.arcLayer.removeAnimationForKey("rotaion")
    }

    class func showHud(inView inView:UIView) -> (DXHUD)
    {
        let hud = self.dxHud()
        let screenSize = UIScreen.mainScreen().bounds.size
        hud.center = CGPointMake(screenSize.width / 2, screenSize.height / 2)
        inView.addSubview(hud)
        hud.beginAnimation()
        return hud
    }

}
