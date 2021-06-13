//
//  OrderCollectionViewCell.swift
//  Ferofly
//
//  Created by ehsan sat on 6/9/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    let foodImageView = UIImageView()
    
    var foodImage = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeImageView()
    }
    
    func makeImageView() {
        
        foodImageView.frame.size.width = UIScreen.main.bounds.width * (1/6) + 10
        foodImageView.frame.size.height = UIScreen.main.bounds.height * (1/6) + 10
        
        foodImageView.contentMode = .scaleAspectFit
        foodImageView.image = foodImage
//        foodImageView.backgroundColor = UIColor.systemRed
        self.addSubview(foodImageView)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
