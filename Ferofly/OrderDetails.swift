//
//  OrderDetails.swift
//  Ferofly
//
//  Created by ehsan sat on 6/7/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class OrderDetails: UIView {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    let firstAnswer = "ORDERNUMBER237846909"
    let secondAnswer = "Oct 23, 2019, 9:08 PM"
    let thirdAnswer = "PHONEPE"
    
    let fontUsed = UIFont.systemFont(ofSize: 16)
    
    let seperatorLine = UIView()
    let secondSepLine = UIView()
    let thirdSepLine = UIView()
    let forthSepLine = UIView()
    
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let firstLabelAnswer = UILabel()
    let secondLabelAnswer = UILabel()
    let thirdLabelAnswer = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLabels()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeLabels()
    }
    
    func makeLabels () {
        seperatorLine.backgroundColor = UIColor.systemGray5
        self.addSubview(seperatorLine)
        
        secondSepLine.backgroundColor = UIColor.systemGray5
        self.addSubview(secondSepLine)
        
        thirdSepLine.backgroundColor = UIColor.systemGray5
        self.addSubview(thirdSepLine)
        
        forthSepLine.backgroundColor = UIColor.systemGray5
        self.addSubview(forthSepLine)
        
        firstLabel.text = "Order ID"
        firstLabel.textAlignment = .left
        firstLabel.textColor = .systemGray2
        self.addSubview(firstLabel)
        
        secondLabel.text = "Order Date"
        secondLabel.textAlignment = .left
        secondLabel.textColor = .systemGray2
        self.addSubview(secondLabel)
        
        thirdLabel.text = "Payment Mode"
        thirdLabel.textAlignment = .left
        thirdLabel.textColor = .systemGray2
        self.addSubview(thirdLabel)
        
        firstLabelAnswer.text = firstAnswer
        firstLabelAnswer.textAlignment = .right
        firstLabelAnswer.textColor = .black
        self.addSubview(firstLabelAnswer)
        
        secondLabelAnswer.text = secondAnswer
        secondLabelAnswer.textAlignment = .right
        secondLabelAnswer.textColor = .black
        self.addSubview(secondLabelAnswer)
        
        thirdLabelAnswer.text = thirdAnswer
        thirdLabelAnswer.textAlignment = .right
        thirdLabelAnswer.textColor = .black
        self.addSubview(thirdLabelAnswer)
        
        layoutLabels()
    }
    
    func layoutLabels() {
        
        seperatorLine.translatesAutoresizingMaskIntoConstraints = false
        secondSepLine.translatesAutoresizingMaskIntoConstraints = false
        thirdSepLine.translatesAutoresizingMaskIntoConstraints = false
        forthSepLine.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabelAnswer.translatesAutoresizingMaskIntoConstraints = false
        secondLabelAnswer.translatesAutoresizingMaskIntoConstraints = false
        thirdLabelAnswer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            seperatorLine.topAnchor.constraint(equalTo: topAnchor),
            seperatorLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            seperatorLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            seperatorLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            seperatorLine.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            secondSepLine.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * ( 1 / 14 )),
            secondSepLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            secondSepLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            secondSepLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondSepLine.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            thirdSepLine.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * ( 2 / 14 )),
            thirdSepLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            thirdSepLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            thirdSepLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            thirdSepLine.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            forthSepLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            forthSepLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            forthSepLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            forthSepLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            forthSepLine.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: topAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            firstLabel.widthAnchor.constraint(equalToConstant: 100),
            firstLabel.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
        ])
        
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * ( 1 / 14 )),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            secondLabel.widthAnchor.constraint(equalToConstant: 100),
            secondLabel.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
        ])
        
        NSLayoutConstraint.activate([
            thirdLabel.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * ( 2 / 14 )),
            thirdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ( 1 / 12 )),
            thirdLabel.widthAnchor.constraint(equalToConstant: 150),
            thirdLabel.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
        ])
        
        NSLayoutConstraint.activate([
            firstLabelAnswer.topAnchor.constraint(equalTo: topAnchor),
            firstLabelAnswer.widthAnchor.constraint(equalToConstant: 300),
            firstLabelAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            firstLabelAnswer.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
        ])
        
        NSLayoutConstraint.activate([
            secondLabelAnswer.topAnchor.constraint(equalTo: secondSepLine.bottomAnchor),
            secondLabelAnswer.widthAnchor.constraint(equalToConstant: 300),
            secondLabelAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            secondLabelAnswer.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
        ])
        
        NSLayoutConstraint.activate([
            thirdLabelAnswer.topAnchor.constraint(equalTo: thirdSepLine.bottomAnchor),
            secondLabelAnswer.widthAnchor.constraint(equalToConstant: 300),
            thirdLabelAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenWidth * ( 1 / 12 )),
            thirdLabelAnswer.heightAnchor.constraint(equalToConstant: screenHeight * ( 1 / 14 ))
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
