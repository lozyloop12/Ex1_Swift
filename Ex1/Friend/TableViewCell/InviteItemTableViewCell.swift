//
//  InviteItemTableViewCell.swift
//  Ex1
//
//  Created by LozyLoop on 21/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit

class InviteItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var person: Person? {
        didSet {
            guard let person = person else { return }
            renderData(with: person)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setup()
    }
    
 
    private func setup() {
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 22
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 1
        addButton.clipsToBounds = true
        
        addButton.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8470588235, blue: 0.8078431373, alpha: 1)
    }
    
    private func renderData(with person: Person) {
        nameLabel.text = person.name ?? ""
    }
}
