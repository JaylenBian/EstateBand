//
//  UserDetailViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import CoreData
import Charts

class UserDetailViewController: UIViewController, ChartViewDelegate {

    // Widget Data
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var workNumberLabel: UILabel!
    @IBOutlet weak var lastCheckinnLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var chartView: LineChartView!
    
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
        
        loadChart()
    }

    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func getCurDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let curTime = dateFormatter.string(from: Date())
        return curTime
    }
    
    func loadChart() {
        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.drawGridBackgroundEnabled = false
        
        // Y-axis limit line
        let ll1 = ChartLimitLine(limit: 60, label: "Safe Lower Limit")
        ll1.lineWidth = 2.0
        ll1.lineDashLengths = [10.0, 3.0]
        ll1.labelPosition = .rightBottom
        ll1.valueFont = UIFont.systemFont(ofSize: 10)
        
        let ll2 = ChartLimitLine(limit: 80, label: "Safe Upper Limit")
        ll2.lineWidth = 2.0
        ll2.lineDashLengths = [10.0, 3.0]
        ll2.labelPosition = .rightBottom
        ll2.valueFont = UIFont.systemFont(ofSize: 10)
        
        chartView.leftAxis.removeAllLimitLines()
        chartView.leftAxis.addLimitLine(ll1)
        chartView.leftAxis.addLimitLine(ll2)
//        leftYAxis.axisMinimum = 40
//        leftYAxis.gridLineDashLengths = [5.0, 5.0]
//        leftYAxis.drawZeroLineEnabled = false
//        leftYAxis.drawLimitLinesBehindDataEnabled = true
        chartView.leftAxis.axisMinimum = 40
        chartView.leftAxis.axisMaximum = 120
        // 关闭背景线
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        
        
        chartView.legend.form = .line
        
        // 装载数据
        updateChartData()
        
        // 设置线条类型
        for set in (chartView.data?.dataSets)! {
            let lineSet: ILineChartDataSet = set as! ILineChartDataSet
            lineSet.mode = .cubicBezier
        }
        chartView.setNeedsDisplay()
        
        
        chartView.animate(xAxisDuration: 1.0, yAxisDuration: 3.0)
    }
    
    func updateChartData() {
        setDataCount(count: 7, range: 40)
    }
    
    func setDataCount(count: Int, range: Double) {
        var values = NSMutableArray.init()
        for i in 0..<count {
            var val: Double = Double(arc4random_uniform(UInt32(range)) + 50)
            values.add(ChartDataEntry(x: Double(i), y: val))
        }
        
        var set1 = LineChartDataSet.init(values: values as! [ChartDataEntry], label: "Heart Rate")
        set1.drawIconsEnabled = false
        set1.lineDashLengths = [5.0, 5.0]
        set1.setColor(UIColor.black)
        set1.setCircleColor(UIColor.blue)
        set1.lineWidth = 1.0
        set1.circleRadius = 5.0
        set1.drawCircleHoleEnabled = true
        set1.valueFont = UIFont.systemFont(ofSize: 10)
        set1.formLineDashLengths = [5.0, 5.0]
        set1.formLineWidth = 1.0
        set1.formSize = 15
        
        let gradientColors: NSArray = [ChartColorTemplates.colorFromString("#ffffff").cgColor,
                                       ChartColorTemplates.colorFromString("#ff0000").cgColor]
        
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors, locations: nil)
        
        set1.fillAlpha = 1.0
        set1.fill = Fill(linearGradient: gradient!, angle: 90)
        set1.drawFilledEnabled = true
        
        let dataSets = NSMutableArray.init()
        dataSets.add(set1)
        let data = LineChartData.init(dataSets: dataSets as! [IChartDataSet])
        chartView.data = data
    }

}
