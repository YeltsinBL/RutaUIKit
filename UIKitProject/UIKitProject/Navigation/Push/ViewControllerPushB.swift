//
//  ViewControllerB.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 20/01/23.
//

import Foundation
import UIKit

class ViewControllerPushB: UIViewController {
    
    private lazy var btnButton: UIButton={
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "View Modal"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.ShowModal()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var btnButtonA: UIButton={
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Regresar a la vista principal"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.BackMain()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var btnButtonB: UIButton={
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Regresar a la vista anterior"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.Back()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        title = "ViewControllerPushB"
//        view.addSubview(btnButton)
        [btnButton, btnButtonA, btnButtonB].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            btnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            btnButtonA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnButtonA.centerYAnchor.constraint(equalTo: btnButton.bottomAnchor, constant: 30),
            
            btnButtonB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnButtonB.centerYAnchor.constraint(equalTo: btnButtonA.bottomAnchor, constant: 30)
        ])
//        self.navigationItem.rig
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextViewController))
    }
    
//       para mostrar un Modal
    func ShowModal(){
        self.present(ViewControllerPushC(), animated: true)
    }
//       regresamos al View Principal
    func BackMain(){
        self.navigationController?.popToRootViewController(animated: true)
    }
//      regresamos a la View anterior
    func Back(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
