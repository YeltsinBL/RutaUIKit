//
//  ChildViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 3/02/23.
//

import UIKit

class ChildViewController: UIViewController {
    
    private lazy var createRequestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Haz click aqui", for: .normal)
        button.addTarget(self, action: #selector(executeHTTP), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(createRequestButton)
        
        NSLayoutConstraint.activate([
            createRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createRequestButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }

    @objc
    func executeHTTP(){
        
//        Añadimos el ActivityIndicatorViewController
        let activityIndicator = ActivityIndicatorViewController() //Creamos una instancia
        view.addSubview(activityIndicator.view) //Añadimos el activityIndicator al ViewController principal
        addChild(activityIndicator)  //Añadimos el activityIndicator como Hijo del viewController principal
        activityIndicator.didMove(toParent: self) //notificamos al activityIndicator que se a movido a un ViewController padre
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            Eliminamos el ActivityIndicatorViewController
            activityIndicator.willMove(toParent: self) //indicamos al activityIndicator que sera eliminado de ViewController padre
            activityIndicator.removeFromParent() // eliminamos al activityIndicator del VieController padre
            activityIndicator.view.removeFromSuperview() // eliminamos la vista del activityIndicator del ViewController Padre
        }
    }
    
}
