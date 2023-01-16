//
//  OnBoardingView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

final class OnBoardingView: UIView{
    
//       Creación de UIImageView
        private let onboardingImageView: UIImageView = {
           let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "iloveprogramming")
//        para activar los constrains por codigo
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
//    Creación de un UILabel
        private let textLabel : UILabel = {
           let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.text = "Creando UIs por codigo"
            label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

//    Creación de un UIButton
        private let messageButton: UIButton = {
            var config = UIButton.Configuration.filled()
            config.title = "Aceptar"
            config.subtitle = "Hecho"
            
            let button = UIButton(type: .system)
//        se agrega un metodo al boton para dar una accion cuando se haga clic
            button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
            button.configuration = config
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
//    creamos dos metodos para que funcione la vista
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        llamamos al setup para que configure la vista
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
//        agregar la vista de imagen creada por codigo a la vista padre
//        view.addSubview(onboardingImageView)
        [onboardingImageView, textLabel, messageButton].forEach(addSubview)
    }
    
    private func configureConstrains(){
//        si no se agrega los constrains no se podra visualizar las vistas creadas por codigo.
        NSLayoutConstraint.activate([
//        para colocar la imagen en la parte superior
//          con esta linea se coloca la imagen en la parte superior pero sin respetar el margen
//            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor),
//          con esta linea se coloca la imagen en la parte superior y si respeta el margen
//            onboardingImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                    
//        aplicar la imagen que este arriba del Text
            onboardingImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -32),
//            hacemos que el lado izquierda del text este pegado al lado izquierdo de la vista
            onboardingImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            hacemos que el lado derecho del text este pegado al lado derecho de la vista
            onboardingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            que este al centro de la vista
            onboardingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                        
//            agregando constrain al Text en la parte inferior para que sea el top del boton
            textLabel.bottomAnchor.constraint(equalTo: messageButton.topAnchor, constant: -42),
//            hacemos que el lado izquierda del text este pegado al lado izquierdo de la vista
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            hacemos que el lado derecho del text este pegado al lado derecho de la vista
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            que este al centro de la vista
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                        
//            ponemos en el centro de la vista al boton
            messageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    messageButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    @objc func showMessage(){
        print("Boton creado por codigo")
    }
}
