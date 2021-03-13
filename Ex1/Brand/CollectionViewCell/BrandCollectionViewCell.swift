//
//  BrandCollectionViewCell.swift
//  Ex1
//
//  Created by LozyLoop on 23/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var subCategoryText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    var article: Article? {
        didSet {
            guard let article = article else { return }
            renderData(with: article)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func renderData(with article: Article) {
        articleImage.image = UIImage(url: URL(string: article.images[0]))
        categoryText.text = article.category ?? ""
        subCategoryText.text = article.subCategory ?? ""
        priceText.text =  String(article.price ?? 1.0)
       }

}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
