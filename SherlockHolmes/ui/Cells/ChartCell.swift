//
//  ChartCell.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/13/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import Charts

class ChartCell: UITableViewCell, ChartViewDelegate {

    @IBOutlet var chart: PieChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func buildChart(regions: NSArray, states: NSArray) {
        let unitsSold = [20.0, 30.0, 15.0, 15.0, 10.0]
        setChart(regions as! [String], values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
   
        chart.legend.enabled = false
        chart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
        chart.usePercentValuesEnabled = true
        chart.drawSlicesUnderHoleEnabled = false;
        chart.transparentCircleRadiusPercent = 0.61;
        chart.descriptionText = "";
        chart.drawCenterTextEnabled = true;
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = PieChartDataSet(yVals: dataEntries, label: "")
        let chartData = PieChartData(xVals: dataPoints, dataSet: chartDataSet)
        chart.data = chartData
        
        chartDataSet.colors = ChartColorTemplates.pastel()
    }
}
