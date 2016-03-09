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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: hud显示时屏幕还可以响应点击
    @IBAction func beginAnimation(sender: UIButton) {
        
        if sender.tag == 1
        {
            DXHUD.showHud(remindTitle: "加载中...", flag: "test", inView: self.view, confi: { (hud:DXHUD) -> () in
            
                hud.desLabel.textColor = UIColor.redColor()
           })
        }
        else if sender.tag == 2
        {
           DXHUD.hiddenHud(hudFlag: "test")
        }
    }
    
   //MARK: hud显示时屏幕无法响应点击
    @IBAction func showMaskHud(sender: UIButton) {
        
        if sender.tag == 3
        {
            DXHUD.showHud(remindTitle: "加载中...", flag: "maskTest", confi: { (hud:DXHUD) -> () in
                
                hud.arcColor = UIColor.orangeColor()
                hud.desLabel.textColor = UIColor.orangeColor()
            })
        }
        else if sender.tag == 4
        {
             DXHUD.hiddenHud(hudFlag: "maskTest")
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}

