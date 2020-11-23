//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 23/11/20.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
                    
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        alert.addAction(botaoCancelar)
        alert.addAction(botaoRemover)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
