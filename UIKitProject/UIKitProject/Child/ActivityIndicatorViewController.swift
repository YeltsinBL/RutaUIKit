//
//  ActivityIndicatorViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 3/02/23.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {
//creamos una propiedad ActivityIndicator para añadirla dentro de la vista del ViewController
    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .white
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}
