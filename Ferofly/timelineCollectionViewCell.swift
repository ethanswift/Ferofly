//
//  timelineCollectionViewCell.swift
//  Ferofly
//
//  Created by ehsan sat on 6/9/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class timelineCollectionViewCell: UICollectionViewCell {
    
    var iconText = ""
    let dotView = UIView()
    var lineView = UIView()
    let iconView = UIImageView()
    let iconLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutViews()
    }
    
    func layoutViews() {
        
        dotView.frame.size.width = 10
        dotView.frame.size.height = 10
        dotView.layer.cornerRadius = 5
        dotView.backgroundColor = UIColor.systemGray5
        self.addSubview(dotView)
        dotView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.frame.size.width = self.frame.width
        lineView.frame.size.height = 2
        lineView.backgroundColor = UIColor.systemGray5
        self.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        iconView.image = UIImage(systemName: "sun.max.fill")
        iconView.bringSubviewToFront(self)
        iconView.alpha = 0
        self.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        iconLabel.text = iconText
        iconLabel.font = UIFont.systemFont(ofSize: 11)
        iconLabel.textAlignment = .center
        iconLabel.textColor = .black
        self.addSubview(iconLabel)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dotView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dotView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dotView.widthAnchor.constraint(equalToConstant: 10),
            dotView.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            iconLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconLabel.heightAnchor.constraint(equalToConstant: 10),
            iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
        
    }
    
}
