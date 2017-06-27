//
//  UserPerformanceViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/27.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class UserPerformanceViewController: UIViewController {
    
    @IBOutlet weak var checkTimes: UILabel!
    @IBOutlet weak var safeTimes: UILabel!
    @IBOutlet weak var dangerTimes: UILabel!
    @IBOutlet weak var fatigueTimes: UILabel!
    @IBOutlet weak var bonus: UILabel!
    @IBOutlet weak var penalties: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var rand: Int!
        rand = Int(arc4random_uniform(10)) + 20
        checkTimes.text = String(format: "%d%@", rand, " Days")
        rand = Int(arc4random_uniform(10)) + 15
        safeTimes.text = String(format: "%d%@", rand, " Days")
        rand = Int(arc4random_uniform(5))
        dangerTimes.text = String(format: "%d%@", rand, " Times")
        rand = Int(arc4random_uniform(10))
        fatigueTimes.text = String(format: "%d%@", rand, " Times")
        rand = (Int(arc4random_uniform(10)) + 45) * 12
        bonus.text = String(format: "%d%@", rand, " Yuan")
        rand = (Int(arc4random_uniform(10)) + 45) * 3
        penalties.text = String(format: "%d%@", rand, " Yuan")
    }

}
