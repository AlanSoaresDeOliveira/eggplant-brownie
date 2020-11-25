//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 25/11/20.
//

import Foundation

class ItemDAO {
    
    func save(_ itens: Item) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        guard let caminho = recuperaDiretorio() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Item> else { return [] }
            return itensSalvos
        
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
