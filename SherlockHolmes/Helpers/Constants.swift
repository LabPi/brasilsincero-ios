//
//  Constants.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    /* STORYBOARD */
    static var STORYBOARD_NAME: String = "Main"
    
    /* TITLES */
    static var AGREEMENTS_TITLE: String = "Convênios"
    static var TRANSFERS_TITLE: String = "Transferências"
    static var COMPLAINT_TITLE: String = "Denúncias"
    
    /* CELLS */
    static var PROGRAMS_CELL: String = "programsCell"
    static var MENU_CELL: String = "menuCell"
    static var COMPLAINT_CELL: String = "complaintCell"
    
    /* VIEW CONTROLLERS ID */
    static var PROGRAMS_ID: String = "ProgramsViewController"
    static var FILTER_ID: String = "FilterViewController"
    
    /* PAGE MENU CONTROLLERS TYPES */
    static var AGREEMENTS_TYPE: Int = 0
    static var TRANSFERS_TYPE: Int = 1
    
    /* RANKING TYPES */
    static var RANKING_NATIONAL: Int = 0
    static var RANKING_REGIONAL: Int = 1
    static var RANKING_STATE: Int = 2
}
