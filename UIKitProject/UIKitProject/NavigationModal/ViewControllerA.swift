//
//  NavigationModalView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 18/01/23.
//

import Foundation
import UIKit

class ViewControllerA: UIViewController {
    
    private lazy var btnBoton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Mostrar VSheet B"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.startNavigation()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var btnBotonD: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Ocultar Sheet A"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.dismissNavigation()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        [btnBoton, btnBotonD].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            btnBoton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnBoton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnBotonD.topAnchor.constraint(equalTo: btnBoton.bottomAnchor, constant: 20),
            btnBotonD.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func startNavigation(){
        present(ViewControllerB(), animated: true)
    }
    func dismissNavigation(){
        dismiss(animated: true)
    }
}
