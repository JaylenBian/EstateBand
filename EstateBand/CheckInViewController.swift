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
        
        checkBox = BEMCheckBox(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
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
    }
    
    
}
