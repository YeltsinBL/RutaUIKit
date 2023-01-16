//
//  ButtonController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

class ButtonView: UIView{
    
    private let btnButton1: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.filled() // estilo del button
        configuration.title = "Primer Boton"
        configuration.subtitle = "por codigo"
        configuration.image = UIImage(systemName: "play.circle.fill")
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let btnButton2: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.bordered() // estilo del button
        configuration.title = "Segundo Boton"
        configuration.titleAlignment = .center
        configuration.subtitle = "por codigo"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .trailing
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let btnButton3: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.bordered() // estilo del button
        configuration.title = "Tercer Boton"
        configuration.titleAlignment = .center
        configuration.subtitle = "por codigo"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .top
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemPurple
        configuration.baseForegroundColor = .white
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//    como el método ya debe de estar inicializado para llamar a la propiedad, se cambia el `let` por el `lazy var`, así no da error el `self`
    private lazy var btnButton4: UIButton = {
//        configuramos las propiedades
        var configuration = UIButton.Configuration.bordered() // estilo del button
        configuration.title = "Cuarto Boton"
        configuration.titleAlignment = .center
        configuration.subtitle = "por codigo"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .top
        configuration.buttonSize = .large
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.showMessage()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        [btnButton1, btnButton2, btnButton3, btnButton4].forEach(addSubview)
    }
    
    private func configureConstrains(){
        
        NSLayoutConstraint.activate([
            btnButton1.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            btnButton1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            btnButton2.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnButton2.topAnchor.constraint(equalTo: btnButton1.bottomAnchor, constant: 8),
            
            btnButton3.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnButton3.topAnchor.constraint(equalTo: btnButton2.bottomAnchor, constant: 8),
            
            btnButton4.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnButton4.topAnchor.constraint(equalTo: btnButton3.bottomAnchor, constant: 8)
        ])
        
    }
    func showMessage() {
        print("Boton presionado")
    }
}
