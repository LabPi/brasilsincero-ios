//
//  ChartsViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/13/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import Charts
import RESideMenu

class ChartsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChartViewDelegate {
    
    var charts: NSArray! = ["5 estados que mais gastam com Convênios",
                            "Regiões que mais gastam com Convênios",
                            "5 estados que mais gastam com Transferências",
                            "Regiões que mais gastam com transferências"]
    
    var regions: NSArray! = ["Norte",
                            "Nordeste",
                            "Centro Oeste",
                            "Sul",
                            "Sudeste"]
    
    var states: NSArray! = ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia"]
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gráficos"
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = backgroundColor
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return charts.count;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return charts[section] as? String
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ChartCell = tableView.dequeueReusableCellWithIdentifier("chartsCell") as! ChartCell
        
        switch indexPath.section {
        case 0:
            cell.buildChart(states, states:states)
        default:
            cell.buildChart(regions, states:states)
        }
        
        return cell
    }
}
