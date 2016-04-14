//
//  AgreementsTableViewCell.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/22/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class AgreementsCell: UITableViewCell {
    
    @IBOutlet var background: UIView!
    @IBOutlet var lblFlag: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblValue: UILabel!
    @IBOutlet var lblLocal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillAttributesWithAgreement(item: Agreement) {
        lblTitle.text = item.title
        lblDate.text = item.date
        lblValue.text = item.value
        lblLocal.text = item.local
    }
}
