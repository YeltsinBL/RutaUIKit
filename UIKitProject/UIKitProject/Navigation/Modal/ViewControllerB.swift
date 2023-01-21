//
//  ViewControllerB.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 18/01/23.
//

import Foundation
import UIKit

class ViewControllerB: UIViewController{
    private lazy var btnBotonD: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Ocultar Sheet B"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.dismissNavigation()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        [btnBotonD].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            btnBotonD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnBotonD.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func dismissNavigation(){
        dismiss(animated: true)
    }
}
