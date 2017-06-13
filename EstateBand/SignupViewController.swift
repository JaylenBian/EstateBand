//
//  SignupViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/11.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {
    
    // Widget data
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var workNumberField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var signupView: UIView!

    // Data
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景
        self.view.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        self.signupView.backgroundColor = UIColor.init(white: 1.0, alpha: 0.95)
        self.signupView.layer.cornerRadius = 15
        
        // 初始化数据
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 注册收回键盘手势
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        // 设置控件
        self.doneButton.layer.cornerRadius = 10
        self.backButton.layer.cornerRadius = 8
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        // 保存数据
        saveContext()
        // 弹窗提醒
        
    }
    
    @IBAction func sexSelectAction(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            maleButton.isSelected = true
            femaleButton.isSelected = false
        case 101:
            maleButton.isSelected = false
            femaleButton.isSelected = true
        default:
            break
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveContext() {
        // 判断是否填写完毕
        let done = (nameField.text != nil) && (accountField.text != nil) && (passwordField.text != nil) && (idField.text != nil) && (workNumberField.text != nil)
        if(done) {
            // 保存添加模型
            let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.appDelegate.managedObjectContext) as! User
            user.name = nameField.text
            user.account = accountField.text
            user.password = passwordField.text
            user.id = Int32.init(idField.text!)!
            user.workNumber = Int32.init(workNumberField.text!)!
            user.sex = maleButton.state==UIControlState.selected ? true : false
            user.pic = "Default"
            // 弹窗提醒
            do {
                try self.appDelegate.managedObjectContext.save()
                let alert = UIAlertController.init(title: "Success", message: "Registered successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: {
                    (action) in self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            } catch {
                let alert = UIAlertController(title: "Failed", message: "Something error!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: {
                    (action) in self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Failed", message: "Please fill all the text field!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended { 
            nameField.resignFirstResponder()
            accountField.resignFirstResponder()
            passwordField.resignFirstResponder()
            idField.resignFirstResponder()
            workNumberField.resignFirstResponder()
        }  
        sender.cancelsTouchesInView = false 
    }
    
    @IBAction func addDefaultData(_ sender: UIButton) {
        // 添加第一个人
        let user_1 = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.appDelegate.managedObjectContext) as! User
        user_1.name = "Michael"
        user_1.account = "micheal123"
        user_1.password = "password"
        user_1.id = 10230003
        user_1.workNumber = 210002
        user_1.sex = true
        user_1.pic = "Michael"
        do {
            try self.appDelegate.managedObjectContext.save()
        } catch {
            NSLog("Save Failed")
        }
        // 添加第二个人
        let user_2 = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.appDelegate.managedObjectContext) as! User
        user_2.name = "Mike"
        user_2.account = "mike@cqu.com"
        user_2.password = "password"
        user_2.id = 20350012
        user_2.workNumber = 210003
        user_2.sex = true
        user_2.pic = "Mike"
        do {
            try self.appDelegate.managedObjectContext.save()
        } catch {
            NSLog("Save Failed")
        }
        // 添加第三个人
        let user_3 = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.appDelegate.managedObjectContext) as! User
        user_3.name = "Steven"
        user_3.account = "steven@mail.com"
        user_3.password = "password"
        user_3.id = 43105128
        user_3.workNumber = 210004
        user_3.sex = true
        user_3.pic = "Steven"
        do {
            try self.appDelegate.managedObjectContext.save()
        } catch {
            NSLog("Save Failed")
        }
    }
    
}
