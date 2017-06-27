//
//  UserCollectionViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/27.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import Charts

class UserCollectionViewController: UIViewController, ChartViewDelegate{
    
    // 控件
    @IBOutlet weak var chartView1: LineChartView!
    @IBOutlet weak var chartView2: LineChartView!
    
    // 数据
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadChart()
    }
    
    func loadChart() {
        chartView1.delegate = self
        chartView1.chartDescription?.enabled = false
        chartView1.dragEnabled = true
        chartView1.setScaleEnabled(true)
        chartView1.pinchZoomEnabled = true
        chartView1.drawGridBackgroundEnabled = false
        
        chartView1.leftAxis.removeAllLimitLines()
        chartView1.leftAxis.axisMinimum = 50
        chartView1.leftAxis.axisMaximum = 150
        // 关闭背景线
        chartView1.leftAxis.drawGridLinesEnabled = false
        chartView1.rightAxis.drawGridLinesEnabled = false
        chartView1.xAxis.drawGridLinesEnabled = false
        
        
        chartView1.legend.form = .line
        
        
        
        
        chartView1.animate(xAxisDuration: 1.0, yAxisDuration: 3.0)
        
        // chart 2
        chartView2.delegate = self
        chartView2.chartDescription?.enabled = false
        chartView2.dragEnabled = true
        chartView2.setScaleEnabled(true)
        chartView2.pinchZoomEnabled = true
        chartView2.drawGridBackgroundEnabled = false
        
        chartView2.leftAxis.removeAllLimitLines()
        chartView2.leftAxis.axisMinimum = 30
        chartView2.leftAxis.axisMaximum = 100
        // 关闭背景线
        chartView2.leftAxis.drawGridLinesEnabled = false
        chartView2.rightAxis.drawGridLinesEnabled = false
        chartView2.xAxis.drawGridLinesEnabled = false
        
        
        chartView2.legend.form = .line
        
        // 装载数据
        updateChartData()
        
        // 设置线条类型
        // 设置线条类型
        for set in (chartView1.data?.dataSets)! {
            let lineSet: ILineChartDataSet = set as! ILineChartDataSet
            lineSet.mode = .cubicBezier
        }
        chartView1.setNeedsDisplay()
        for set in (chartView2.data?.dataSets)! {
            let lineSet: ILineChartDataSet = set as! ILineChartDataSet
            lineSet.mode = .cubicBezier
        }
        chartView2.setNeedsDisplay()
        
        
        chartView1.animate(xAxisDuration: 1.0, yAxisDuration: 3.0)
        chartView2.animate(xAxisDuration: 1.0, yAxisDuration: 3.0)
    }
    
    func updateChartData() {
        setDataCount1(count: 7, range: 70)
        setDataCount2(count: 12, range: 50)
    }
    
    func setDataCount1(count: Int, range: Double) {
        var values = NSMutableArray.init()
        for i in 0..<count {
            var val: Double = Double(arc4random_uniform(UInt32(range)) + 50)
            values.add(ChartDataEntry(x: Double(i), y: val))
        }
        
        var set1 = LineChartDataSet.init(values: values as! [ChartDataEntry], label: "Mason Amount")
        set1.drawIconsEnabled = false
        set1.lineDashLengths = [5.0, 0]
        set1.setColor(UIColor.black)
        set1.setCircleColor(UIColor.blue)
        set1.lineWidth = 1.0
        set1.circleRadius = 5.0
        set1.drawCircleHoleEnabled = true
        set1.valueFont = UIFont.systemFont(ofSize: 10)
        set1.formLineDashLengths = [5.0, 0]
        set1.formLineWidth = 1.0
        set1.formSize = 15
        
        let gradientColors: NSArray = [ChartColorTemplates.colorFromString("#ffffff").cgColor,
                                       ChartColorTemplates.colorFromString("#0000ff").cgColor]
        
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors, locations: nil)
        
        set1.fillAlpha = 1.0
        set1.fill = Fill(linearGradient: gradient!, angle: 90)
        set1.drawFilledEnabled = true
        
        let dataSets1 = NSMutableArray.init()
        dataSets1.add(set1)
        let data1 = LineChartData.init(dataSets: dataSets1 as? [IChartDataSet])
        chartView1.data = data1
    }
    
    func setDataCount2(count: Int, range: Double) {
        var values = NSMutableArray.init()
        for i in 0..<count {
            var val: Double = Double(arc4random_uniform(UInt32(range)) + 40)
            values.add(ChartDataEntry(x: Double(i), y: val))
        }
        
        var set2 = LineChartDataSet.init(values: values as! [ChartDataEntry], label: "Tecnicial Amount")
        set2.drawIconsEnabled = false
        set2.lineDashLengths = [5.0, 0]
        set2.setColor(UIColor.black)
        set2.setCircleColor(UIColor.blue)
        set2.lineWidth = 1.0
        set2.circleRadius = 5.0
        set2.drawCircleHoleEnabled = true
        set2.valueFont = UIFont.systemFont(ofSize: 10)
        set2.formLineDashLengths = [5.0, 0]
        set2.formLineWidth = 1.0
        set2.formSize = 15
        
        let gradientColors: NSArray = [ChartColorTemplates.colorFromString("#ffffff").cgColor,
                                       ChartColorTemplates.colorFromString("#00ff00").cgColor]
        
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors, locations: nil)
        
        set2.fillAlpha = 1.0
        set2.fill = Fill(linearGradient: gradient!, angle: 90)
        set2.drawFilledEnabled = true
        
        let dataSets2 = NSMutableArray.init()
        dataSets2.add(set2)
        let data2 = LineChartData.init(dataSets: dataSets2 as? [IChartDataSet])
        chartView2.data = data2
    }

    
}
