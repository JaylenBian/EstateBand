//
//  UserHealthViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class UserHealthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航数据
        self.navigationItem.title = "Warning management"
        // 设置底栏数据
        self.tabBarItem.title = "Warning management"
        self.tabBarItem.image = UIImage(named: "userHealth")
        
    }

}
