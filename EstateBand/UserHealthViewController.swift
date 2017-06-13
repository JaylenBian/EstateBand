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
//        self.tabBarItem.title = "Warning management"
//        self.tabBarItem.image = UIImage(named: "userHealth")
        
        
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
        imageView.image = UIImage(named: "userName")
        self.view.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 30, y: 40, width: 300, height: 50))
        label.text = "Hello world"
        label.font = UIFont.systemFont(ofSize: 36)
        self.view.addSubview(label)
    }

}
