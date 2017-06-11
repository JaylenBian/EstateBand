//
//  SignupViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/11.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var doneButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        // 保存数据
        
        // 弹窗提醒
        let alert = UIAlertController.init(title: "Success", message: "Registered successfully", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: {
            (action) in self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
