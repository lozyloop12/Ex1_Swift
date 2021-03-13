//
//  BrandViewController.swift
//  Ex1
//
//  Created by LozyLoop on 21/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController{
    
    

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var brandView: UICollectionView!
    var data = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpUI()
        brandView.delegate = self
        brandView.dataSource = self
        GetDataArticle()
    }
    
    func GetDataArticle(){
        Helper.getListArticle { (article) in
            if((article.data?.data) != nil){
                self.data = article.data?.data ?? []
                self.brandView?.reloadData()
            }
        }
    }
    
    
    private func setUpUI(){
           shopImage.contentMode = .scaleAspectFill
           shopImage.layer.cornerRadius = 30
           addButton.layer.cornerRadius = 5
           addButton.clipsToBounds = true
            let nib_brand = UINib(nibName: "BrandCollectionViewCell", bundle: .main)
            brandView.register(nib_brand, forCellWithReuseIdentifier: "BrandCollectionViewCell")
       }

}

extension BrandViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCollectionViewCell", for: indexPath) as? BrandCollectionViewCell else {
            return UICollectionViewCell()
        }
        let article = data[indexPath.row]
        cell.article = article
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height
        let width = view.frame.size.width
        return CGSize(width: width * 0.41333, height: width * 0.6266)
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 22, bottom: 10, right: 22)
    }
    
}
