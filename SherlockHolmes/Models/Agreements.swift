//
//  Agreement.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/11/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

final class Agreement: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {
    
    let title: String
    let date: String
    let value: String
    let local: String
    
    @objc required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.title = representation.valueForKeyPath("nm_programa") as! String
        self.date = representation.valueForKeyPath("dt_proposta") as! String
        self.value = representation.valueForKeyPath("vl_global") as! String
        self.local = String(format: "%@ / %@",
                           representation.valueForKeyPath("nm_municipio_proponente") as! String,
                           representation.valueForKeyPath("uf_proponente") as! String)
    }
    
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Agreement] {
        var agreements: [Agreement] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for agreementRepresentation in representation {
                if let agreement = Agreement(response: response, representation: agreementRepresentation) {
                    agreements.append(agreement)
                }
            }
        }
        
        return agreements
    }
}
