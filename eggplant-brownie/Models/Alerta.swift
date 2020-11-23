//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 23/11/20.
//

import UIKit


class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
                    
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        alert.addAction(botaoCancelar)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
