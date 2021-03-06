//
//  WZCustomAnimationListViewController.swift
//  SwiftDemo
//
//  Created by 吴哲 on 2018/5/11.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"


class WZCustomAnimationListViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WZCustomAnimatedListCell
        cell.imageView.backgroundColor = UIColor.randomColor
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
           let head = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! WZCustomAnimatedListHeadView
           head.imageView.backgroundColor = UIColor.randomColor
           return head
        }
        return UICollectionReusableView(frame: .zero)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let w:CGFloat = (self.view.frame.width - 10.0 * 4.0) / 3.0
            layout.itemSize = CGSize(width: w, height: w)
            layout.minimumLineSpacing = 9.0
            layout.minimumInteritemSpacing = 9.0
            layout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
        }
    }
}
