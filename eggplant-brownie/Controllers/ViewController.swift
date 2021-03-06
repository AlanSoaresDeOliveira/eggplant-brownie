//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Alan Soares de Oliveira on 19/11/20.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func adicionar(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
           
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar itens", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        recuperaItens()
    }
    
    func recuperaItens() {
        itens = ItemDAO().recupera()
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDAO().save(item)
        if let tabelView = itensTableView {
            tabelView.reloadData()
        } else {
            Alerta.init(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].name
        return celula      
        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .checkmark {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }         
        
            
        } else {
            celula.accessoryType = .checkmark
            let index = indexPath.row
            itensSelecionados.append(itens[index])
            
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperarRefeicaoDoFormulario() {
            delegate?.adicionar(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta.init(controller: self).exibe(mensagem: "Erro ao ler dados do formuláro.")
        }
    }
    
    func recuperarRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else { return nil }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao)  else { return nil }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }

}

