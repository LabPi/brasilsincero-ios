//
//  Endpoints.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/11/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import Alamofire

class Endpoints: NSObject {
    
    //MARK: AGRREEMENTS
    static func rankingAgreementsByNational(onCompletion: (result: NSDictionary) -> Void) {
        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/convenios/convenios_ranking_nacional.json")
            .responseJSON { response in
            if let JSON = response.result.value {
                onCompletion(result: JSON as! NSDictionary)
            }
        }
    }
    
    static func rankingAgreementsByRegion(onCompletion: (result: NSDictionary) -> Void) {
        

        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/convenios/convenios_regioes.json")
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(result: JSON as! NSDictionary)
                }
        }
    }
    
    static func rankingAgreementsByState(onCompletion: (result: NSDictionary) -> Void) {
        
        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/convenios/convenios_estados.json")
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(result: JSON as! NSDictionary)
                }
        }
    }
    
    //MARK: TRANSFERS
    static func rankingTransfersByNational(onCompletion: (result: NSDictionary) -> Void) {
        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/transferencias/transferencias_ranking_nacional.json")
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(result: JSON as! NSDictionary)
                }
        }
    }
    
    static func rankingTransfersByRegion(onCompletion: (result: NSDictionary) -> Void) {
        
        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/transferencias/transferencias_regioes.json")
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(result: JSON as! NSDictionary)
                }
        }
    }
    
    static func rankingTransfersByState(onCompletion: (result: NSDictionary) -> Void) {
        
        Alamofire.request(.GET, "http://thiagoguimaraes.com.br/clients/brasilsincero/transferencias/transferencias_estados.json")
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(result: JSON as! NSDictionary)
                }
        }
    }
}
