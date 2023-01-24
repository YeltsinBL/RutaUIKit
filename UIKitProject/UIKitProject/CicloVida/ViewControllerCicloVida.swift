//
//  ViewControllerCicloVida.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 24/01/23.
//

import UIKit

class ViewControllerCicloVida: UIViewController {
    deinit {
        print("Se ha liberado en memoria al ViewController")
    }
    private lazy var btnButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Mostrar otro ViewController"
//        para liberar memoria por el boton se utiliza '[weak self]' y el '?' en el self
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
//            self?.presentCurrentViewController()
            self?.changeConstrainValue()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
    }()
    
    var buttonConstrain: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1. viewDidLoad \(self.description)")
        
        view.backgroundColor = [.systemRed, .systemBlue, .systemCyan, .systemMint, .systemPink].randomElement()
        
        view.addSubview(btnButton)
        
        buttonConstrain = btnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            btnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonConstrain!
        ])
        
    }
    
    func presentCurrentViewController() {
        self.present(ViewControllerCicloVida(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2. viewWillAppear \(self.description)")
    }

    func changeConstrainValue(){
        view.removeConstraint(buttonConstrain!)
        buttonConstrain = btnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        
        NSLayoutConstraint.activate([
            btnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonConstrain!
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("3. viewWillLayoutSubviews \(self.description)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("4. viewDidLayoutSubviews \(self.description)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5. viewDidAppear \(self.description)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6. viewWillDisappear \(self.description)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7. viewDidDisappear \(self.description)")
    }
}
