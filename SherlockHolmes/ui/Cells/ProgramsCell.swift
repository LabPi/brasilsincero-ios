//
//  AgreementsTableViewCell.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/22/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class ProgramsCell: UITableViewCell {
    
    @IBOutlet var background: UIView!
    @IBOutlet var lblFlag: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblValue: UILabel!
    @IBOutlet var lblLocal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UICustomizeHelper.buildFlag(lblFlag, cornerRadius: 20, withBorder: false)
    }
    
    func fillAttributesWithAgreements(item: NSDictionary) {
        lblTitle.text = item["nm_programa"] as? String
        lblDate.text = item["dt_proposta"] as? String
        lblValue.text = item["vl_global"] as? String
        lblLocal.text = String(format: "%@ / %@",
                               item["nm_municipio_proponente"] as! String,
                               item["uf_proponente"] as! String)

    }
    
    func fillAttributesWithTransfers(item: NSDictionary) {
        lblTitle.text = item["nm_identif_favorecido_dl"] as? String
        lblDate.text = item["dt_emissao_dl"] as? String
        lblValue.text = item["vl_bruto_dl"] as? String
        lblLocal.text = String(format: "%@ / %@",
                               item["nm_municipio_convenente"] as! String,
                               item["uf_convenente"] as! String)
        
    }
}
