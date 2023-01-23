//
//  DelegationPatternView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 22/01/23.
//

import Foundation
import UIKit

class DelegationPatternView: UIView {
    
    let apiClient = ApiClient() //instanciamos la clase
    
    private let btnButton1: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.filled() // estilo del button
        configuration.title = "Cambiar de Texto"
        
//        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
//            self.didTapOnAcceptButton()
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubviews()
        configureConstrains()
    }
    
    private func addSubviews() {
//        agregar la vista creada por codigo a la vista padre
//        view.addSubview(onboardingImageView)
//        indicamos que la Vista sera el delegate del ApiCliente
        apiClient.delegate = self
        [btnButton1, lblLabel].forEach(addSubview)
    }
    
    private func configureConstrains(){
        
        NSLayoutConstraint.activate([
            lblLabel.centerYAnchor.constraint(equalTo: btnButton1.topAnchor, constant: -32),
            lblLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            btnButton1.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnButton1.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    @objc func didTapOnAcceptButton(){
        apiClient.getPokemons()
    }
}
//indicamos que la vista conformara el ApiClientDelegate para recibir los datos y actualizar la informacion
extension DelegationPatternView: ApiClientDelegate {
    func update(pokemons: PokemonsRespondeDataModel) {
        DispatchQueue.main.async {
            self.lblLabel.text = pokemons.pokemons.randomElement()?.name
        }
    }
}
