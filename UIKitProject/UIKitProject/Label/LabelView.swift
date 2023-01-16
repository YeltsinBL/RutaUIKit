//
//  LabelView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

class LabelView: UIView{
    
    private let lblLabel1: UILabel = {
        let label = UILabel()
        label.text = "Primer Label por codigo"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.textAlignment = .center
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblLabel2: UILabel = {
        let label = UILabel()
        label.text = "Segundo Label por codigo, configurando las distancias de los margenes laterales"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0 //para que el texto no se corte si sobrepasa la primera linea
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblLabel3: UILabel = {
        let text = "Tercer Label por codigo, configurando las distancias de los margenes laterales"
//        Creacion de un diccionario con las propiedades del Text
        let attributeText: [NSAttributedString.Key: Any] = [
            .underlineStyle : NSUnderlineStyle.single.rawValue, //linea subrayada
            .underlineColor : UIColor.red, // color de la linea subrayada
            .foregroundColor: UIColor.white, // color de la letra del texto
            .backgroundColor: UIColor.blue, // color del fondo del texto
            .font: UIFont.systemFont(ofSize: 32)
        ]
        
        let attributeString = NSAttributedString(string: text, attributes: attributeText)
        
        let label = UILabel()
        label.attributedText = attributeString
        label.numberOfLines = 0 //para que el texto no se corte si sobrepasa la primera linea
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
        [lblLabel1, lblLabel2, lblLabel3].forEach(addSubview)
    }
    
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            lblLabel1.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            lblLabel1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lblLabel2.topAnchor.constraint(equalTo: lblLabel1.bottomAnchor, constant: 12),
            lblLabel2.centerXAnchor.constraint(equalTo: centerXAnchor),
//            damos un margen al lado derecho del texto
            lblLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
//            damos un margen al lado izquierdo del texto
            lblLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            lblLabel3.topAnchor.constraint(equalTo: lblLabel2.bottomAnchor, constant: 12),
            lblLabel3.centerXAnchor.constraint(equalTo: centerXAnchor),
//            damos un margen al lado derecho del texto
            lblLabel3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
//            damos un margen al lado izquierdo del texto
            lblLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        ])
    }
}
