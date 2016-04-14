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

class ViewController: UIViewController, UISearchBarDelegate, CAPSPageMenuDelegate, RankingProtocol {
    
    var rankingProtocol: RankingProtocol?
    
    var pageMenu : CAPSPageMenu?
    var controller1: ProgramsTableViewController!
    var controller2: ProgramsTableViewController!
    var pagePosition: Int = 0
    
    var titleView: UIView!
    var menuBarButton: UIBarButtonItem!
    var searchController1: String! = ""
    var searchController2: String! = ""
    var searchBar: UISearchBar!
    @IBOutlet var searchButton: UIBarButtonItem!

    let searchSelector: Selector = #selector(ViewController.showSearchBar)
    let filterSelector: Selector = #selector(ViewController.showFilterView)

    var filterItem: UIBarButtonItem!
    var filterViewController: FilterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildTabBar()
        buildSearch()
        rankingProtocol = self 
        RankingHelper.buildRankingButton(self, rankingProtocol: rankingProtocol!)
        buildFilterView()
        
        titleView = self.navigationItem.titleView
        menuBarButton = self.navigationItem.leftBarButtonItem
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = backgroundColor
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    //MARK: PAGE MENU
    
    func buildTabBar() {
        let storyboard = UIStoryboard(name: Constants.STORYBOARD_NAME, bundle: nil)
        
        var controllerArray : [UIViewController] = []
        
        self.controller1 = storyboard.instantiateViewControllerWithIdentifier(Constants.PROGRAMS_ID) as! ProgramsTableViewController
        self.controller1.title = Constants.AGREEMENTS_TITLE
        self.controller1.controllerType = Constants.AGREEMENTS_TYPE
        controllerArray.append(controller1)
        
        self.controller2 = storyboard.instantiateViewControllerWithIdentifier(Constants.PROGRAMS_ID) as! ProgramsTableViewController
        self.controller2.title = Constants.TRANSFERS_TITLE
        self.controller2.controllerType = Constants.TRANSFERS_TYPE
        controllerArray.append(controller2)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: PageMenuHelper.customize())
        
        pageMenu?.delegate = self
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMoveToParentViewController(self)
        
        UICustomizeHelper.addShadowInView(pageMenu!.view)
    }
    
    func didMoveToPage(controller: UIViewController, index: Int) {
        
        pagePosition = index
        
        if (searchBar != nil) {
            switch index {
            case 0:
                searchController2 = searchBar.text
                self.searchBar.text = searchController1
                break
            case 1:
                searchController1 = searchBar.text
                self.searchBar.text = searchController2
                break
            default:
                break
            }
        }
    }
    
    //MARK: SEARCH
    func buildSearch() {
        searchButton.action = searchSelector
        searchButton.target = self
    }
    
    func createSearchBarButtonItem() {
        let searchItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: searchSelector)
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    func showSearchBar() {
        
        self.searchBar = UISearchBar(frame: CGRect.init(x: 0, y: 0, width: 250, height: 30))
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
        self.closeSearchBar()
        
        searchController1 = ""
        searchController2 = ""
        
        self.controller1.updateList("")
        self.controller2.updateList("")
    }
    
    func closeSearchBar() {
        
        UIView.animateWithDuration(0.5, animations: {
            self.searchBar.alpha = 0.0
        }) { (finish: Bool) in
            self.navigationItem.titleView = self.titleView
            self.navigationItem.leftBarButtonItem = self.menuBarButton
            self.createSearchBarButtonItem()
            self.searchBar.alpha = 0.0;
            
            UIView.animateWithDuration(0.5, animations: {
                self.searchBar.alpha = 1.0
            })
        }
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        getTextSearchForView()
    }
    
    func getTextSearchForView() {
        
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
    
    //MARK: FILTER
    func buildFilterView() {
        let storyboard = UIStoryboard(name: Constants.STORYBOARD_NAME, bundle: nil)
        self.filterViewController = storyboard.instantiateViewControllerWithIdentifier(Constants.FILTER_ID) as! FilterViewController
    }
    
    func showFilterView() {
        self.navigationController?.view.addSubview(self.filterViewController.view)
    }
    
    func removeFilterView() {
        self.filterViewController.view.removeFromSuperview()
    }
    
    func createFilterBarButtonItem() {
        let filterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        filterButton.setBackgroundImage(UIImage(named: "icone_busca_avancada"), forState: UIControlState.Normal)
        filterButton.addTarget(self, action: filterSelector, forControlEvents: UIControlEvents.TouchUpInside)
        self.filterItem = UIBarButtonItem(customView: filterButton)
        self.navigationItem.leftBarButtonItem = self.filterItem
    }
    
    //MARK: RANKING PROTOCOL
    func updateListWithRanking(rankingType: Int) {
        
        if (searchBar != nil) { getTextSearchForView() }
        
        switch pagePosition {
        case 0:
            self.controller1.applyRanking(rankingType)
            
            break
        case 1:
            self.controller2.applyRanking(rankingType)
            break
        default:
            break
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}
