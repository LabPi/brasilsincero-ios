//
//  PageMenuHelper.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import PageMenu

class PageMenuHelper: NSObject {
    
    static func customize() -> [CAPSPageMenuOption] {
    
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
        
        return parameters
    }

}
