//
//  UserHealthViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import UserNotifications

class UserHealthViewController: UITableViewController {
    
    // Widget Data
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var warningButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航数据
        self.navigationItem.title = "Health Managment"
        // 设置底栏数据
//        self.tabBarItem.title = "Warning management"
//        self.tabBarItem.image = UIImage(named: "userHealth")
    }
    
    @IBAction func warnAction(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default();
        content.title = "Alert"
        content.subtitle = "Dangrous area"
        content.body = "One worker in dangerous area!"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "identifer", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

    }
    
    @IBAction func logoutActiuon(_ sender: UIButton) {
//        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
//        present(loginViewController!, animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    

}
