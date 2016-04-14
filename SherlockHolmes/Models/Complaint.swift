//
//  Complaint.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class Complaint: NSObject {
    
    var title : String!
    var date : String!
    var value : String!
    var local : String!
    var complaint : String!
    var complaintDescription : String!
    
    init(title: String, date: String, value: String, local: String, complaint: String, complaintDescription: String) {
        self.title = title
        self.date = date
        self.value = value
        self.local = local
        self.complaint = complaint
        self.complaintDescription = complaintDescription
    }
}
