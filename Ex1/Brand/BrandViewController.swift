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
    var data = [Brand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        setUpUI()
        brandView.delegate = self
        brandView.dataSource = self
    }
    
    
    private func setUpUI(){
           shopImage.contentMode = .scaleAspectFill
           shopImage.layer.cornerRadius = 30
           addButton.layer.cornerRadius = 5
           addButton.clipsToBounds = true
        data = Array.init(repeating: Brand(category: "Haut", description:  "Classic black dress", cost: 153.4), count: 10)
            let nib_brand = UINib(nibName: "BrandCollectionViewCell", bundle: .main)
        brandView.register(nib_brand, forCellWithReuseIdentifier: "BrandCollectionViewCell")
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

extension BrandViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCollectionViewCell", for: indexPath) as? BrandCollectionViewCell else {
            return UICollectionViewCell()
        }
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
