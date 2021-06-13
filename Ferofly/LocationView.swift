//
//  LocationView.swift
//  Ferofly
//
//  Created by ehsan sat on 6/7/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class LocationView: UIView {
    
    let address = "OFFICE"
    
    let placeName = "2nd Floor, Nho 12, Road no 37, Back side of MGS Hospital, Punjabi Bagh, Delhi, 110026, India"
    
    let instructionText = "Instruction: Call on arrival, bring cutlry"
    
    let mappinImage = UIImage(systemName: "mappin")
    
    let fontUsed = UIFont.systemFont(ofSize: 16)
    
    let screenWidth = UIScreen.main.bounds.width
    
    let screenHeight = UIScreen.main.bounds.height
    
    let mapImageView = UIImageView()
    
    let addLabel = UILabel()
    
    let placeLabel = UILabel()
    
    let instructionLabel = UILabel()
    
    let sepLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeView()
    }
    
    func makeView () {
        mapImageView.image = mappinImage
        mapImageView.contentMode = .scaleAspectFit
        self.addSubview(mapImageView)
        
        addLabel.text = address
        addLabel.textAlignment = .left
        addLabel.font = fontUsed
        self.addSubview(addLabel)
        
        placeLabel.text = placeName
        placeLabel.textAlignment = .left
        placeLabel.textColor = .systemGray2
        placeLabel.numberOfLines = 3
        placeLabel.font = fontUsed
        self.addSubview(placeLabel)
        
        instructionLabel.text = instructionText
        instructionLabel.textAlignment = .left
        instructionLabel.textColor = .systemGray2
        instructionLabel.numberOfLines = 1
        instructionLabel.font = fontUsed
        self.addSubview(instructionLabel)
        
        sepLine.backgroundColor = .systemGray5
        self.addSubview(sepLine)
        
        layoutViews()
    }

    func layoutViews() {
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        sepLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapImageView.topAnchor.constraint(equalTo: topAnchor),
            mapImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            mapImageView.widthAnchor.constraint(equalToConstant: screenWidth * ( 1 / 6 )),
            mapImageView.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 6 ))
        ])
        
        NSLayoutConstraint.activate([
            addLabel.widthAnchor.constraint(equalToConstant: screenWidth * (3 / 4)),
            addLabel.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * (1/28)),
            addLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            addLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * (1/4)),
            placeLabel.heightAnchor.constraint(equalToConstant: 150),
            placeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            placeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * (1/12))
        ])
        
        NSLayoutConstraint.activate([
            instructionLabel.widthAnchor.constraint(equalToConstant: screenWidth * (3 / 4)),
//            instructionLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor),
            instructionLabel.heightAnchor.constraint(equalToConstant: 30),
            instructionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            instructionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            sepLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * (1 / 12)),
            sepLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * (1 / 12)),
            sepLine.heightAnchor.constraint(equalToConstant: 2),
            sepLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            sepLine.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
