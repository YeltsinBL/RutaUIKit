//
//  CustomCollectionViewCell.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 18/01/23.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
//    creamos stackview para ahorrar código de las constrain por celda
    private let svStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 1
        stackView.backgroundColor = UIColor.lightGray
        return stackView
    }()
    
    private let imgImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let lblLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        [svStackView].forEach(addSubview)
        [imgImage, lblLabel].forEach(svStackView.addArrangedSubview)
        
        NSLayoutConstraint.activate([
            svStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            svStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            svStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    Método para rellenar las celdas
    func configure (model: Devices){
        imgImage.image = UIImage(systemName: model.imageName)
        lblLabel.text = model.tittle
    }
}
