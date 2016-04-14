//
//  AgreementsTableViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class ProgramsTableViewController: UITableViewController {
    
    var agreements: NSArray!
    var allAgreements: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.AGREEMENTS_TITLE
        
        buildData()
    }
    
    func buildData() {
        allAgreements = NSArray()
        agreements = NSArray()
        
        allAgreements = Data.getAllAgreements()
        agreements = allAgreements
        //        agreements = SortHelper.orderAgreementByValue(allAgreements as! [Agreement])
        
        self.tableView.reloadData()
    }
    
    //MARK: UITABLEVIEW DATASOURCE
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agreements.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell : AgreementsCell = tableView.dequeueReusableCellWithIdentifier(Constants.AGREEMENTS_CELL) as! AgreementsCell
        cell.fillAttributesWithAgreement(agreements[indexPath.row] as! Agreement)
    
        return cell
    }
    
    //MARK: SEARCH
    func updateList(input: String) {
    
        self.agreements = SearchHelper.search(input, allArray: allAgreements)
        tableView.reloadData()
    }
}
