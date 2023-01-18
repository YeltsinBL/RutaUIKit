//
//  StackView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 18/01/23.
//

import Foundation
import UIKit

class StackView: UIView {
//    Creación de StackView
    private let svStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        especificar la alineación, por defecto es horizontal
        stackView.axis = .vertical
        stackView.spacing = 20 //dar un espacio tipo padding
//        stackView.alignment = .trailing //alinear las vistas
        return stackView
    }()
    
//    creación del título
    private let lblLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecciona el precio"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
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
        
        ["$ 1.00","$ 10.00","$ 00.00","$ 1000.00"].forEach { price in
            let btn = UIButton(type: .system)
            var configuration = UIButton.Configuration.borderedTinted()
            configuration.title = price
            configuration.subtitle = "Suscription"
            configuration.image = UIImage(systemName: "dollarsign.circle.fill")
            configuration.imagePadding = 12
            configuration.baseBackgroundColor = .systemBlue
            btn.configuration = configuration
            
            svStackView.addArrangedSubview(btn)
        }
        
        [lblLabel, svStackView].forEach(addSubview)
    }
    
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            
            lblLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            lblLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lblLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            svStackView.topAnchor.constraint(equalTo: lblLabel.bottomAnchor, constant: 32),
            svStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            svStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
        ])
        
    }
    
}
