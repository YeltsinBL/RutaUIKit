//
//  ImageView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

class ImageView: UIView{
    
    private let imgImage1 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "gamecontroller.fill")
        image.contentMode = .scaleAspectFit // para que la imagen no se distorsione
        image.tintColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        
//        Añadir un borde circular
        image.layer.cornerRadius = 150
        image.layer.borderWidth = 10
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.shadowColor = UIColor.green.cgColor
        image.layer.shadowOpacity = 5.0
//        image.layer.shadowOffset = CGSize(width: 1, height: 1)
        image.layer.shadowRadius = 8.0
        
        return image
    }()
    private let imgImage2: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "iloveprogramming")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
//        Añadir un borde circular
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.masksToBounds = true //para hacer los cortes a la imagen fuera del círculo
        return imageView
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
//        agregar la vista creada por código a la vista padre
        [imgImage1, imgImage2].forEach(addSubview)
    }
    
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            imgImage1.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imgImage1.centerXAnchor.constraint(equalTo: centerXAnchor),
//            Añadimos un ancho y alto
            imgImage1.widthAnchor.constraint(equalToConstant: 300),
            imgImage1.heightAnchor.constraint(equalToConstant: 300),
            
            imgImage2.topAnchor.constraint(equalTo: imgImage1.bottomAnchor, constant: 50),
            imgImage2.centerXAnchor.constraint(equalTo: centerXAnchor),
//            Añadimos un ancho y alto
            imgImage2.widthAnchor.constraint(equalToConstant: 280),
            imgImage2.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
