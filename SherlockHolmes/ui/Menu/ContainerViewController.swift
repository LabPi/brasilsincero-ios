//
//  ContainerViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/12/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import RESideMenu

class ContainerViewController: RESideMenu, RESideMenuDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        self.contentViewShadowColor = UIColor.blackColor()
        self.contentViewShadowOffset = CGSizeMake(0, 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = true;
        
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController")            
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("leftMenuViewController")
    
        self.backgroundImage = UIImage(named: "background")
        self.delegate = self;
    }
}
