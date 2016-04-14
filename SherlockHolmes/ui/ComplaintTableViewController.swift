//
//  ComplaintTableViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import RESideMenu

class ComplaintTableViewController: UITableViewController {
    
    var complaints: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DENÚNCIAS"
        
        let complaint = Complaint(title: "Gestão da Política de Desenvolvimento Urbano", date: "13/10/2016", value: "1.000.000,00", local: "Aracaju - SE", complaint: "Denúncia", complaintDescription: "O Ministério Público deveria investigar essa transferência pois minha cidade é muito pequena e nunca ocorreu a obra mencionada. Além disso o valor é muito alto, suspeito que há algo errado aqui.")
        
        complaints = NSMutableArray()
        
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = backgroundColor
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complaints.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ComplaintCell = tableView.dequeueReusableCellWithIdentifier(Constants.COMPLAINT_CELL) as! ComplaintCell
        
        cell.fillAttributesWithComplaint(complaints[indexPath.row] as! Complaint)
        
        return cell
    }

}
