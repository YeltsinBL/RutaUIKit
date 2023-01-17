//
//  CustomTableViewCell.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
//Creamos dos propiedades que serán como subvistas
    private let imgImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let lblLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    sobre escribimos este init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [imgImageView, lblLabel].forEach(addSubview)
        
        NSLayoutConstraint.activate([
            imgImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
            imgImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imgImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            imgImageView.widthAnchor.constraint(equalToConstant: 40),
            imgImageView.heightAnchor.constraint(equalToConstant: 40),
            
            lblLabel.leadingAnchor.constraint(equalTo: imgImageView.trailingAnchor,constant: 20),
            lblLabel.centerYAnchor.constraint(equalTo: imgImageView.centerYAnchor),
            
        ])
        
    }
    
//    agregamos este init que es requerido porque estamos creando la vista por código
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    creamos un método para pasar los datos a las celdas
    func configure(model: Device) {
        imgImageView.image = UIImage(systemName: model.imageName)
        lblLabel.text = model.tittle
    }
    
}
