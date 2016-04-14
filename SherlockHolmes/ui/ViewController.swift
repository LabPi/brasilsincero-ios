//
//  ViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/21/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import PageMenu
import ExpandingMenu

class ViewController: UIViewController, UISearchBarDelegate, CAPSPageMenuDelegate {
    
    var pageMenu : CAPSPageMenu?
    var controller1: AgreementsTableViewController!
    var controller2: TransfersViewController!
    var pagePosition: Int = 0
    
    var searchController1: String! = ""
    var searchController2: String! = ""
    var searchBar: UISearchBar!
    @IBOutlet var searchButton: UIBarButtonItem!

    let searchSelector: Selector = #selector(ViewController.showSearchBar)
    let filterSelector: Selector = #selector(ViewController.showFilterView)
    let reportSelector: Selector = #selector(ViewController.showReportView)

    var filterItem: UIBarButtonItem!
    var filterViewController: FilterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildTabBar()
        buildSearch()
        buildRankingButton()
        buildFilterView()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationController!.navigationBar.translucent = false
    }
    
    
    func buildFilterView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.filterViewController = storyboard.instantiateViewControllerWithIdentifier("FilterViewController") as! FilterViewController
    }
    
    func buildRankingButton() {
        let menuButtonSize: CGSize = CGSize(width: 64.0, height: 64.0)
        let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPointZero, size: menuButtonSize), centerImage: UIImage(named: "ranking_floating_button")!, centerHighlightedImage: UIImage(named: "ranking_floating_button")!)
        menuButton.center = CGPointMake(self.view.bounds.width - 60.0, self.view.bounds.height - 130.0)
        view.addSubview(menuButton)
        
        let item1 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Nacional", image: UIImage(named: "ranking_nacional")!, highlightedImage: UIImage(named: "ranking_nacional")!, backgroundImage: UIImage(named: "ranking_nacional"), backgroundHighlightedImage: UIImage(named: "ranking_nacional")) { () -> Void in
            // Do some action
        }

        
        let item2 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Estadual", image: UIImage(named: "ranking_estadual")!, highlightedImage: UIImage(named: "ranking_estadual")!, backgroundImage: UIImage(named: "ranking_estadual"), backgroundHighlightedImage: UIImage(named: "ranking_estadual")) { () -> Void in
            // Do some action
        }
        
        let item3 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Regional", image: UIImage(named: "ranking_regional")!, highlightedImage: UIImage(named: "ranking_regional")!, backgroundImage: UIImage(named: "ranking_regional"), backgroundHighlightedImage: UIImage(named: "ranking_regional")) { () -> Void in
            // Do some action
        }
        
        menuButton.addMenuItems([item1, item2, item3])
    }
    
    func showFilterView() {
        self.addChildViewController(self.filterViewController)
        self.view.addSubview(self.filterViewController.view)
    }
    
    func removeFilterView() {
        self.filterViewController.view.removeFromSuperview()
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func showReportView() {
        
    }
    
    func buildSearch() {
        searchButton.action = searchSelector
        searchButton.target = self
    }
    
    func buildTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        self.controller1 = storyboard.instantiateViewControllerWithIdentifier("AgreementsViewController") as! AgreementsTableViewController
        self.controller1.title = "Convênios"
        
        controllerArray.append(controller1)
        
        self.controller2 = storyboard.instantiateViewControllerWithIdentifier("TransferencesViewController") as! TransfersViewController
        self.controller2.title = "Transferências"
        
        controllerArray.append(controller2)
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)),
            .ViewBackgroundColor(UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 0.5)),
            .BottomMenuHairlineColor(UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 0.5)),
            .SelectionIndicatorColor(UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 203.0/255.0, alpha: 1)),
            .MenuMargin(20.0),
            .MenuHeight(40.0),
            .SelectedMenuItemLabelColor(UIColor.whiteColor()),
            .UnselectedMenuItemLabelColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Light", size: 18.0)!),
            .UseMenuLikeSegmentedControl(true),
            .SelectionIndicatorHeight(4.0),
            .MenuItemSeparatorPercentageHeight(0.4),
            .MenuItemSeparatorWidth(0.1)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        pageMenu?.delegate = self
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
        
        ViewUtils.addShadowInView(pageMenu!.view)

    }
    
    func didMoveToPage(controller: UIViewController, index: Int) {
        
        pagePosition = index
        
        if (searchBar != nil) {
            switch index {
            case 0:
                searchController2 = searchBar.text
                break
            case 1:
                searchController1 = searchBar.text
                break
            default:
                break
            }
            
            clearSearch()
        }
    }
    
    func createFilterBarButtonItem() {
        let filterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        filterButton.setBackgroundImage(UIImage(named: "icone_busca_avancada"), forState: UIControlState.Normal)
        self.filterItem = UIBarButtonItem(customView: filterButton)
        self.navigationItem.leftBarButtonItem = self.filterItem
    }
    
    func createSearchBarButtonItem() {
        let searchItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: searchSelector)
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    func createReportBarButtonItem() {
        let reportItem = UIBarButtonItem(barButtonSystemItem: .Organize, target: self, action: reportSelector)
        self.navigationItem.leftBarButtonItem = reportItem
    }

    
    func showSearchBar() {
        
        self.searchBar = UISearchBar(frame: CGRect.init(x: 0, y: 0, width: 250, height: 50))
        self.searchBar.showsCancelButton = true
        self.searchBar.delegate = self
        
        UIView.animateWithDuration(0.5, animations: { 
            self.searchBar.alpha = 0.0;
        }) { (finish: Bool) in
            self.navigationItem.leftBarButtonItem = nil;
            self.navigationItem.rightBarButtonItem = nil;
            self.navigationItem.titleView = self.searchBar;
            self.searchBar.alpha = 0.0;
            
            self.createFilterBarButtonItem()
            
            UIView.animateWithDuration(0.5
                , animations: { 
                    self.searchBar.alpha = 1.0;
                }, completion: { (finish: Bool) in
                    self.searchBar.becomeFirstResponder()
            })
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        UIView.animateWithDuration(0.5, animations: { 
            self.searchBar.alpha = 0.0
        }) { (finish: Bool) in
            self.navigationItem.titleView = nil;
            
            self.createSearchBarButtonItem()
            self.createReportBarButtonItem()
            
            self.searchBar.alpha = 0.0;
            
            UIView.animateWithDuration(0.5, animations: { 
//                self.searchButton.alpha = 1.0
            })
        }
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        clearSearch()
    }
    
    func clearSearch() {
        
        switch pagePosition {
        case 0:
            self.searchBar.text = searchController1
            break
        case 1:
            self.searchBar.text = searchController2
            break
        default:
            break
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        switch pagePosition {
        case 0:
            self.controller1.updateList(searchBar.text!)
            break
        case 1:
            self.controller2.updateList(searchBar.text!)
            break
        default:
            break
        }
    }
}
