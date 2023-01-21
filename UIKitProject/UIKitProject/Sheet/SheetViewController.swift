//
//  SheetViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 20/01/23.
//

import Foundation
import UIKit

class SheetViewController: UIViewController{
    private let lblLabel:UILabel = {
       let label = UILabel()
        label.text = "Sheet Presentation"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(lblLabel)
        NSLayoutConstraint.activate([
            lblLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        guard let presentationController = presentationController as? UISheetPresentationController else {
            return
        }
        presentationController.detents = [.medium(), .large()] // se agregan todos los tamaños de la vista del Sheeet
        presentationController.selectedDetentIdentifier = .medium // el tamaño inicial del Sheet
        presentationController.prefersGrabberVisible = true // para mostrar la barra pequeña en el Sheet
        presentationController.preferredCornerRadius = 20
        
        
    }
    
}
