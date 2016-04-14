//
//  SearchHelper.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class SearchHelper: NSObject {
    
    static func search(input: String, type: Int, allDictionary: NSMutableDictionary) -> NSMutableDictionary {
        
        var dictionary: NSMutableDictionary = NSMutableDictionary()
        
        if (input.isEmpty) {
            dictionary = allDictionary
        } else {
            for key in allDictionary.allKeys {

                let searchResults: NSArray!
                
                switch type {
                case 0:
                    searchResults = (allDictionary[key as! String] as! NSArray).filteredArrayUsingPredicate(NSPredicate(format: "nm_programa contains[c] %@", input))
                    break
                default:
                    searchResults = (allDictionary[key as! String] as! NSArray).filteredArrayUsingPredicate(NSPredicate(format: "nm_identif_favorecido_dl contains[c] %@", input))
                    break
                }
                
                dictionary.setObject(searchResults, forKey: key as! String)
            }
        }
        
        return dictionary
    }
}
