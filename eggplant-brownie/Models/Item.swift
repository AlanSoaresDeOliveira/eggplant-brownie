//
//  Item.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 19/11/20.
//

import UIKit

class Item: NSObject {
    let name: String
    let calorias: Double
    
    init(name: String, calorias: Double) {
        self.name = name
        self.calorias = calorias
    }
}
