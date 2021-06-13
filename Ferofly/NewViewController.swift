//
//  NewViewController.swift
//  Ferofly
//
//  Created by ehsan sat on 6/9/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    let orderImageView = UIImageView()
    let images = [UIImage(named: "image1"), UIImage(named: "image2")]
    let cellID = "Cell"
    var progressArr = ["Cooking", "Picked", "On way", "Delivered", "Done"]
    var progressLblArr = ["Preparing Dinner", "The Mael Has Been Picked UP", "It Is On The Way", "It Reached The Destination", "It Has Been Recieved"]
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    let itemLabel = UILabel()
    let detailLabel = UILabel()
    
    let orderDetails: UIView = OrderDetails()
    let locationView: UIView = LocationView()
    
    let stageLbl = UILabel()
    let durationLbl = UILabel()
    
    let appleMapBtn = UIButton()
    let redBtn = UIButton()
    
    var time: Int = 0
    var timeArr = [5, 4, 3, 2, 1]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .white
            
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backItem?.title = "Order details"
        self.navigationController?.navigationBar.backItem?.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: .normal)
         self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "stop")

                // tab bar
                
        self.tabBarController?.tabBar.frame.size.height = 50
        self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height - 50
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.items![1].image = UIImage(systemName: "stop")?.withAlignmentRectInsets(UIEdgeInsets(top: 30, left: 0, bottom: -30, right: 0))
        self.tabBarController?.tabBar.items![2].image = UIImage(systemName: "chevron.right")?.withAlignmentRectInsets(UIEdgeInsets(top: 30, left: 0, bottom: -30, right: 0))
        self.tabBarController?.tabBar.items?.first?.image = UIImage(systemName: "increase.quotelevel")?.withAlignmentRectInsets(UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0))
        self.tabBarController?.tabBarItem.title = nil
        self.tabBarController?.tabBar.backgroundColor = UIColor.systemGray5
                
                // collection views
                
        orderCollectionView.delegate = self
        orderCollectionView.dataSource = self
        orderCollectionView.backgroundColor = UIColor.clear
        orderCollectionView.register(OrderCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.view.addSubview(orderCollectionView)
        orderCollectionView.translatesAutoresizingMaskIntoConstraints = false

                
        timelineCollectionView.delegate = self
        timelineCollectionView.dataSource = self
        timelineCollectionView.register(timelineCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        timelineCollectionView.backgroundColor = .white
         self.view.addSubview(timelineCollectionView)
        timelineCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addOrderLabel()
        makeLayout()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func willEnterForground () {
        print("we're back on track")
        self.tabBarController?.tabBar.frame.size.height = 50
        self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height - 50
    }
    
    func addOrderLabel() {
        
        itemLabel.text = " 2 items ordered"
        itemLabel.textAlignment = .left
        itemLabel.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailLabel.text = "See details "
        detailLabel.textAlignment = .left
        detailLabel.textColor = .black
        detailLabel.font = .systemFont(ofSize: 14)
        self.view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(orderDetails)
        orderDetails.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(locationView)
        locationView.translatesAutoresizingMaskIntoConstraints = false
        
        stageLbl.text = ""
        stageLbl.alpha = 0
        stageLbl.textAlignment = .left
        stageLbl.textColor = .black
        stageLbl.font = .systemFont(ofSize: 16)
        self.view.addSubview(stageLbl)
        stageLbl.translatesAutoresizingMaskIntoConstraints = false
        
        durationLbl.text = "Expected arrival time:"
        durationLbl.textAlignment = .left
        durationLbl.textColor = .systemGray
        durationLbl.font = .systemFont(ofSize: 14)
        self.view.addSubview(durationLbl)
        durationLbl.translatesAutoresizingMaskIntoConstraints = false
        
        appleMapBtn.setTitle("Track Order", for: .normal)
        appleMapBtn.setTitleColor(.gray, for: .normal)
        appleMapBtn.setImage(UIImage(systemName: "pin"), for: .normal)
        appleMapBtn.titleEdgeInsets.left = 10
        appleMapBtn.imageEdgeInsets.left = -10
        appleMapBtn.layer.cornerRadius = 5
        appleMapBtn.backgroundColor = .systemGray5
        appleMapBtn.titleLabel?.font = .systemFont(ofSize: 16)
        appleMapBtn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.view.addSubview(appleMapBtn)
        appleMapBtn.translatesAutoresizingMaskIntoConstraints = false
        
        redBtn.setTitle("Report Issue", for: .normal)
        redBtn.setTitleColor(.white, for: .normal)
        redBtn.titleLabel?.font = .systemFont(ofSize: 16)
        redBtn.isUserInteractionEnabled = false
        redBtn.backgroundColor = .systemRed
        redBtn.layer.cornerRadius = 10
        redBtn.layer.shadowOffset.width = 6
        redBtn.layer.shadowOffset.height = 6
        redBtn.layer.shadowColor = UIColor.systemGray.cgColor
        redBtn.layer.shadowOpacity = 0.7
        self.view.bringSubviewToFront(redBtn)
        self.view.addSubview(redBtn)
        redBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func btnClicked () {
//        28.6737595,77.1341145
        let url = "http://maps.apple.com/?ll=28.6737595,77.1341145"
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }
    
    lazy var orderCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let orderCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        return orderCV
    }()
    
    lazy var timelineCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize.width = self.screenWidth * (1/5)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let timelineCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        return timelineCV
    }()
    
    func makeLayout () {
        
        NSLayoutConstraint.activate([
            orderCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: screenWidth * (1/12)),
            orderCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            orderCollectionView.widthAnchor.constraint(equalToConstant: screenWidth * (1/3)),
            orderCollectionView.heightAnchor.constraint(equalToConstant: screenWidth * (1/6))
        ])
        
        NSLayoutConstraint.activate([
            itemLabel.leadingAnchor.constraint(equalTo: orderCollectionView.trailingAnchor, constant: 0),
            itemLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
            itemLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: orderCollectionView.trailingAnchor, constant: 0),
            detailLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 10),
            detailLabel.widthAnchor.constraint(equalToConstant: 100),
            detailLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            orderDetails.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            orderDetails.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            orderDetails.topAnchor.constraint(equalTo: orderCollectionView.bottomAnchor),
            orderDetails.heightAnchor.constraint(equalToConstant: screenHeight * (3/14))
        ])
        
        NSLayoutConstraint.activate([
            locationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            locationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            locationView.topAnchor.constraint(equalTo: orderDetails.bottomAnchor),
            locationView.heightAnchor.constraint(equalToConstant: screenHeight * (3/14))
        ])
        
        NSLayoutConstraint.activate([
            timelineCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            timelineCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            timelineCollectionView.heightAnchor.constraint(equalToConstant: screenHeight * (1/14) + 20),
            timelineCollectionView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            stageLbl.topAnchor.constraint(equalTo: timelineCollectionView.bottomAnchor),
            stageLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: screenWidth * (1/12)),
            stageLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stageLbl.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            durationLbl.topAnchor.constraint(equalTo: timelineCollectionView.bottomAnchor, constant: 30),
            durationLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: screenWidth * (1/12)),
            durationLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            durationLbl.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            appleMapBtn.topAnchor.constraint(equalTo: durationLbl.bottomAnchor, constant: 30),
            appleMapBtn.heightAnchor.constraint(equalToConstant: 40),
            appleMapBtn.widthAnchor.constraint(equalToConstant: 200),
            appleMapBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: screenWidth * (1/12))
        ])
        
        NSLayoutConstraint.activate([
            redBtn.topAnchor.constraint(equalTo: appleMapBtn.bottomAnchor, constant: 20),
            redBtn.heightAnchor.constraint(equalToConstant: 35),
            redBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: screenWidth * (1/12)),
            redBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -screenWidth * (1/12))
        ])

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:     Int) -> Int {
        if collectionView == orderCollectionView {
            return 2
        } else {
            return 5
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == orderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OrderCollectionViewCell
                cell.foodImageView.image = images[indexPath.row]!
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! timelineCollectionViewCell
                cell.iconText = progressArr[indexPath.row]
                cell.iconLabel.text = progressArr[indexPath.row]
                print(progressArr[indexPath.row])
            return cell
        }
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == timelineCollectionView {
            
            print(indexPath)
            UIView.animate(withDuration: 4, delay: 0, options: .curveEaseInOut, animations: {
                for i in 0...indexPath.row {
                    let cell = collectionView.cellForItem(at: [0,i]) as! timelineCollectionViewCell
                    cell.iconView.alpha = 1
                    cell.lineView.backgroundColor = .systemBlue
                }
            }) { (completed) in
                UIView.animate(withDuration: 1) {
                    self.stageLbl.text = self.progressLblArr[indexPath.row]
                    self.stageLbl.alpha = 1
                    self.time = self.timeArr[indexPath.row]
                    self.durationLbl.text = "Expected arrival time: \(self.time)"
//                    self.durationLbl.alpha = 1
                }
            }
        }
    }
    
}
