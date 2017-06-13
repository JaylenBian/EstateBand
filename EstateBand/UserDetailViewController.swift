//
//  UserDetailViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import CoreData

class UserDetailViewController: UIViewController {

    // Widget Data
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var workNumberLabel: UILabel!
    @IBOutlet weak var lastCheckinnLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var userPic: UIImageView!
    
    //Data
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 装载数据
        nameLabel.text = user.name
        accountLabel.text = user.account
        workNumberLabel.text = String(format: "%d", user.workNumber)
        let curTime = getCurDate()
        NSLog("%@", curTime)
        lastCheckinnLabel.text = curTime
        sexLabel.text = user.sex ? "Male" : "Female"
        // 设置界面数据
        self.navigationItem.title = user.name
        self.userPic.layer.cornerRadius = 20
        self.userPic.image = UIImage(named: self.user.pic!)
    }

    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func getCurDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let curTime = dateFormatter.string(from: Date())
        return curTime
    }

}
