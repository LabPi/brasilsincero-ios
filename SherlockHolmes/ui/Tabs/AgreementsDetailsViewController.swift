//
//  AgreementsDetailsViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class AgreementsDetailsViewController: UIViewController, UITableViewDataSource {
    
    var complaints: NSMutableArray!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detalhes"
        
        self.createAddComplaintBarButton()
        self.buildData()
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = backgroundColor
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    //MARK: UITABLEVIEW DATASOURCE
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complaints.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ComplaintCell = tableView.dequeueReusableCellWithIdentifier(Constants.COMPLAINT_CELL) as! ComplaintCell
        cell.fillAttributesWithComplaint(complaints[indexPath.row] as! Complaint)
        
        return cell
    }
    
    //MARK: ACTIONS
    func buttonMethod() {
        
        let storyboard = UIStoryboard(name: Constants.STORYBOARD_NAME, bundle: nil)
        
        let controller: UIViewController! = storyboard.instantiateViewControllerWithIdentifier("AddComplaintViewController") as! AddComplaintViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: OTHERS
    func createAddComplaintBarButton() {
        let buttonAddComplaint = UIButton(frame: CGRectMake(0, 0, 45, 45))
        buttonAddComplaint.setImage(UIImage(named: "icone_denuncias_bege"), forState: UIControlState.Normal)
        buttonAddComplaint.addTarget(self, action: #selector(AgreementsDetailsViewController.buttonMethod), forControlEvents: UIControlEvents.TouchUpInside)
        let barButtonAddComplaint:UIBarButtonItem = UIBarButtonItem(customView: buttonAddComplaint)
        
        navigationItem.setRightBarButtonItem(barButtonAddComplaint, animated: true)
    }
    
    func buildData() {
        
        let complaint = Complaint(title: "Gestão da Política de Desenvolvimento Urbano", date: "13/10/2016", value: "1.000.000,00", local: "Aracaju - SE", complaint: "Denúncia", complaintDescription: "O Ministério Público deveria investigar essa transferência pois minha cidade é muito pequena e nunca ocorreu a obra mencionada. Além disso o valor é muito alto, suspeito que há algo errado aqui.")
        
        complaints = NSMutableArray()
        
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
        complaints.addObject(complaint)
    }
}
