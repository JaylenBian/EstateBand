//
//  HealthyViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/27.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class HealthyViewController: UIViewController {
    
    // 控件
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var restButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var healthyLabel: UILabel!
    @IBOutlet weak var notiLabel: UILabel!
    
    // 数据
    var rate: Int = 85
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
        sosButton.layer.cornerRadius = 50
        restButton.layer.cornerRadius = 50
        refreshButton.layer.cornerRadius = 50
        
        self.notiLabel.textColor = UIColor.green
        self.notiLabel.text = "Healthy"
        
        self.healthyLabel.textColor = UIColor.green
        self.healthyLabel.text = String(rate)
    }
    
    @IBAction func sosAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func restAction(_ sender: UIButton) {
        
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
        let arc = arc4random_uniform(10)
        rate += Int(arc)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        
        healthyLabel.text = String(rate)
        if rate >= 100 {
            healthyLabel.textColor = UIColor.red
            notiLabel.textColor = UIColor.red
            notiLabel.text = String("You need rest now!")
        }
        
        UIView.commitAnimations()
    }
    
    
}
