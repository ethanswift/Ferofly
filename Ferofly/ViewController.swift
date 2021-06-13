//
//  ViewController.swift
//  Ferofly
//
//  Created by ehsan sat on 6/7/21.
//  Copyright © 2021 ehsan sat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let orderImageView = UIImageView()
    let images = [UIImage(named: "image1"), UIImage(named: "image2")]
    let cellID = "Cell"
    var progressArr = ["Cooking", "Picked", "On way", "Delivered", "Done"]
    
    let orderDetails: UIView = OrderDetails()
    let locationView: UIView = LocationView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "goToNew", sender: self)

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
        self.view.addSubview(orderCollectionView)
        orderCollectionView.translatesAutoresizingMaskIntoConstraints = false
//
        timelineCollectionView.delegate = self
        timelineCollectionView.dataSource = self
        timelineCollectionView.register(timelineCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.view.addSubview(timelineCollectionView)
        timelineCollectionView.translatesAutoresizingMaskIntoConstraints = false

        // Do any additional setup after loading the view.
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
        let timelineCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        return timelineCV
    }()

    func makeLayout () {

        NSLayoutConstraint.activate([
        ])

        NSLayoutConstraint.activate([
        ])

    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == orderCollectionView {
            return 2
        } else {
            return 5
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == orderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! timelineCollectionViewCell
            cell.iconText = progressArr[indexPath.row]
            return cell
        }
    }
    
    
}

