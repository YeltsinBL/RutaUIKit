//
//  ViewControllerDP.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 22/01/23.
//

import Foundation
import UIKit

class ViewControllerDP: UIViewController {
//    se ejecuta cuando se libera memoria al cerrar una aplicación
    deinit {
        print("Se libero memeoria")
    }
    
    let apiClient = ApiClient() //instanciamos la clase
    
    private let btnButton1: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.filled() // estilo del button
        configuration.title = "Cambiar de Texto"
        
//        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
//            self?.didTapOnAcceptButton()
//        }))
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapOnAcceptButton), for: .touchUpInside)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let lblLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        apiClient.delegate = self
        [lblLabel, btnButton1].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            lblLabel.centerYAnchor.constraint(equalTo: btnButton1.topAnchor, constant: -32),
            lblLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            btnButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapOnAcceptButton() {
        apiClient.getPokemons()
    }
}

extension ViewControllerDP: ApiClientDelegate {
    func update(pokemons: PokemonsRespondeDataModel) {
        DispatchQueue.main.async {
            self.lblLabel.text = pokemons.pokemons.randomElement()?.name
        }
    }
}
