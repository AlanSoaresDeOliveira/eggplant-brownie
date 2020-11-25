//
//  Item.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 19/11/20.
//

import UIKit

class Item: NSObject, NSCoding {
        
    let name: String
    let calorias: Double
    
    // MARK: - Init
    
    init(name: String, calorias: Double) {
        self.name = name
        self.calorias = calorias
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
