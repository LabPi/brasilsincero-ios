//
//  Transfer.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/11/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

final class Transfer: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {

    let title: String
    let date: String
    let value: String
    let local: String
    
    @objc required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.title = representation.valueForKeyPath("nm_identif_favorecido_dl") as! String
        self.date = representation.valueForKeyPath("dt_emissao_dl") as! String
        self.value = representation.valueForKeyPath("vl_bruto_dl") as! String
        self.local = String(format: "%@ / %@",
                            representation.valueForKeyPath("nm_municipio_convenente") as! String,
                            representation.valueForKeyPath("uf_convenente") as! String)
    }
    
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Transfer] {
        var transfers: [Transfer] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for userRepresentation in representation {
                if let transfer = Transfer(response: response, representation: userRepresentation) {
                    transfers.append(transfer)
                }
            }
        }
        
        return transfers
    }
}
