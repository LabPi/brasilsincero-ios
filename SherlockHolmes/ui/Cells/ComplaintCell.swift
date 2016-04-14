//
//  ComplaintCell.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/24/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class ComplaintCell: UITableViewCell {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblLocal: UILabel!
    @IBOutlet var lblValue: UILabel!
    @IBOutlet var lblComplaintDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillAttributesWithComplaint(item: Complaint) {
        
        if (lblTitle != nil) {
            lblTitle.text = item.title
            lblValue.text = item.value
            lblLocal.text = item.local
        }

        lblDate.text = item.date
        lblComplaintDescription.text = item.complaintDescription
    }
}
