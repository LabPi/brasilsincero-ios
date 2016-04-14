//
//  AgreementsTableViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import RESideMenu

class ProgramsTableViewController: UITableViewController {
    
    var programs: NSMutableDictionary! = NSMutableDictionary()
    var allPrograms: NSMutableDictionary! = NSMutableDictionary()
    
    @IBOutlet weak var rankingHeaderText: UILabel!
    var controllerType: Int!
    var rankingType: Int! = Constants.RANKING_NATIONAL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        applyRankingNational()
    }
    
    
    //MARK: UITABLEVIEW DATASOURCE
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return programs.allKeys.count
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let key: String = programs.allKeys[section] as! String
        if (programs[key]?.count != 0) {
            return 60
        }
        
        return 0;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key: String = programs.allKeys[section] as! String
        if (programs[key]?.count != 0) {
            return programs.allKeys[section] as? String
        }
    
        return nil
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key: String! = programs.allKeys[section] as! String
        return (programs[key]?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ProgramsCell = tableView.dequeueReusableCellWithIdentifier(Constants.PROGRAMS_CELL) as! ProgramsCell
        let key: String! = programs.allKeys[indexPath.section] as! String
        
        switch controllerType {
        case 0:
            cell.fillAttributesWithAgreements(programs[key]![indexPath.row] as! NSDictionary)
        default:
            cell.fillAttributesWithTransfers(programs[key]![indexPath.row] as! NSDictionary)
        }
        
        return cell
    }
    
    //MARK: SEARCH
    func updateList(input: String) {
        
        self.programs = SearchHelper.search(input, type: controllerType, allDictionary: allPrograms)
        tableView.reloadData()
    }
    
    func setController(type: Int) {
        controllerType = type
    }
    
    func applyRanking(type: Int) {
        rankingType = type
        
        switch rankingType {
        case Constants.RANKING_NATIONAL:
            self.applyRankingNational()
            break
        case Constants.RANKING_REGIONAL:
            self.applyRankingRegional()
            break
        case Constants.RANKING_STATE:
            self.applyRankingState()
            break
        default:
            self.applyRankingNational()
            break
        }
    }
    
    func updateListWithRanking(result: NSDictionary) {
        
        self.allPrograms = result.mutableCopy() as! NSMutableDictionary
        self.programs = self.allPrograms
        self.tableView.reloadData()
    }
    
    func applyRankingNational() {
        
        programs = NSMutableDictionary()
        allPrograms = NSMutableDictionary()
        rankingHeaderText.text = "Ranking nacional ordenado por valor"
        
        switch controllerType {
            
        case 0:
            Endpoints.rankingAgreementsByNational({ (result) in
                self.updateListWithRanking(result)
            })
        default:
            Endpoints.rankingTransfersByNational({ (result) in
                self.updateListWithRanking(result)
            })
        }
    }
    
    func applyRankingRegional() {
        
        programs = NSMutableDictionary()
        allPrograms = NSMutableDictionary()
        rankingHeaderText.text = "Ranking regional ordenado por valor"
        
        switch controllerType {
            
        case 0:
            Endpoints.rankingAgreementsByRegion({ (result) in
                self.updateListWithRanking(result)
            })
            
            break
        default:
            Endpoints.rankingTransfersByRegion({ (result) in
                self.updateListWithRanking(result)
            })
            
            break
        }
    }
    
    func applyRankingState() {
        
        programs = NSMutableDictionary()
        allPrograms = NSMutableDictionary()
        rankingHeaderText.text = "Ranking estadual ordenado por valor"
        
        switch controllerType {
            
        case 0:
            Endpoints.rankingAgreementsByState({ (result) in
                self.updateListWithRanking(result)
            })
            
            break
        default:
            Endpoints.rankingTransfersByState({ (result) in
                self.updateListWithRanking(result)
            })
            
            break
        }
    }
}
