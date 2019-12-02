//
//  PeopleTableViewCell.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit
import AlamofireImage

class PeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = #imageLiteral(resourceName: "avatar-placeholder")
    }
    
    // MARK: Setups
    
    private func setupView() {
        holderView.layer.cornerRadius = 10
        selectionView.layer.cornerRadius = 10
        holderView.layer.setupShadow()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
    
    // MARK: Methods
    
    func configure(person: Person) {
        if let imageUrl = URL(string: person.avatarUrl ?? "") { avatarImageView.af_setImage(withURL: imageUrl) }
        nameLabel.text = person.fullName
        emailLabel.text = person.email ?? ""
    }
    
    func highlight() {
        selectionView.isHidden = false
    }
    
    func unhighlight() {
        selectionView.isHidden = true
    }
    
}
