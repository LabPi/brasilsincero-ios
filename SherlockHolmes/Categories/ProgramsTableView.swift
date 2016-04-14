//
//  AgreementsBackground.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class AgreementsTableView: UITableView {

    override func drawRect(rect: CGRect) {
        let image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        image.image = UIImage(named: "background")
        self.backgroundView = image
         
    }
}
