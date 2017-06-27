//
//  CheckInViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/27.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    
    // 控件
    var checkBox: BEMCheckBox!
    @IBOutlet weak var button: UIButton!
    
    // 数据
    var kCenterX: CGFloat!
    var kCenterY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kCenterX = self.view.frame.width/2
        kCenterY = self.view.frame.height/2
        
        setupUI()
        
    }
    
//    BEMCheckBox *myCheckBox = [[BEMCheckBox alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    [self.view addSubview:myCheckBox];
    
    func setupUI() {
        let backgroundLayer = CAGradientLayer()
        backgroundLayer.colors = [UIColor.green.cgColor, UIColor.white.cgColor]
        backgroundLayer.startPoint = CGPoint(x: 0.5, y: 0)
        backgroundLayer.endPoint = CGPoint(x: 0.5, y: 1)
        backgroundLayer.frame = self.view.bounds
        self.view.layer.addSublayer(backgroundLayer)
        self.view.bringSubview(toFront: button)
        
        checkBox = BEMCheckBox(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        checkBox.on = false
        checkBox.boxType = .circle
        checkBox.onAnimationType = .fill
        checkBox.onFillColor = UIColor.blue
        checkBox.onCheckColor = UIColor.white
        self.view.addSubview(checkBox)
    }
    
    func checkedAction() {
        
        checkBox.setOn(true, animated: true)
        
    }
    
    @IBAction func checkAction(_ sender: UIButton) {
        
        self.checkedAction()
        self.button.setTitle("Successful", for: .normal)
        
    }
    
    
}
