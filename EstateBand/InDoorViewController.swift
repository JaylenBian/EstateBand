//
//  InDoorViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/28.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class InDoorViewController: UIViewController {
    
    // 控件
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var safeLabel: UILabel!
    @IBOutlet weak var notifLabel: UILabel!
    var curPosition: UIButton!
    
    // 数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func startAction(_ sender: Any) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(3.0)
        
        curPosition.frame.origin.y -= 80
        
        UIView.commitAnimations()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(showAlert), userInfo: nil, repeats: false)
    }
    
    func showAlert() {
        self.curPosition.backgroundColor = UIColor.red
        
        safeLabel.textColor = UIColor.red
        safeLabel.text = "Danger"
        
        notifLabel.text = "You are in dangerous zone!"
        
        let alert = UIAlertController(title: "Warning", message: "You are in dangerous area", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil) 
    }

}

extension InDoorViewController {
    
    func setupUI() {
        
        curPosition = UIButton(frame: CGRect(x: 197, y: 440, width: 20, height: 20))
        curPosition.layer.cornerRadius = curPosition.frame.width/2
        curPosition.backgroundColor = UIColor.green
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(shineButton), userInfo: nil, repeats: true)
        
        self.view.addSubview(curPosition)
    }
    
    func shineButton() {
        
        if curPosition.isHidden {
            curPosition.isHidden = false
        }
        else {
            curPosition.isHidden = true
        }
        
    }
    
}
