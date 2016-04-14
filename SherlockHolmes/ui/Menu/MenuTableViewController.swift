//
//  MenuTableViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/12/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuImages: NSArray! = ["menu_ranking", "menu_graficos", "menu_denuncias", "menu_estatisticas", "menu_avaliar"]
    var menu: NSArray! = ["Ranking", "Gráficos", "Denúncias", "Estatísticas", "Avaliar o App"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : MenuCell = tableView.dequeueReusableCellWithIdentifier(Constants.MENU_CELL) as! MenuCell
        cell.imgIcon?.image = UIImage(named: menuImages[indexPath.row] as! String)
        cell.lblMenu.text = menu[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch (indexPath.row) {
        case 0:
            
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("TabsViewController"))!), animated: true)
            self.sideMenuViewController.hideMenuViewController()

            break;
        case 1:
            
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("ChartsViewController"))!), animated: true)
            self.sideMenuViewController.hideMenuViewController()
            
            break;
        case 2:
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("ComplaintViewController"))!), animated: true)
            self.sideMenuViewController.hideMenuViewController()

            break;
        case 3:
            let refreshAlert = UIAlertController(title: "Em Breve", message: "Esta funcionalidade será desenvolvida na próxima versão.", preferredStyle: UIAlertControllerStyle.Alert)
            refreshAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            }))
        
            presentViewController(refreshAlert, animated: true, completion: nil)

            break;
        default:
            break;
        }
    }
}
