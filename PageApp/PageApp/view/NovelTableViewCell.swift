//
//  TableViewCell.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import UIKit

class NovelTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let thumbnailImageView = UIImageView()
    let purchaseButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func initUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        purchaseButton.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(purchaseButton)
        contentView.addSubview(thumbnailImageView)
        
        initThumbnailImage()
        initPurchaseButton()
        initTitleConstraint()
        initAuthorConstraint()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initTitleConstraint() {
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: purchaseButton.leadingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor).isActive = true
        print(titleLabel.contentHuggingPriority(for: .horizontal))
        
    }
    
    func initAuthorConstraint() {
        authorLabel.leadingAnchor.constraint(equalTo:titleLabel.leadingAnchor).isActive = true
        authorLabel.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    }
    
    func initPurchaseButton() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        purchaseButton.setTitle("구매", for: .normal)
        purchaseButton.setTitleColor(UIColor.blue, for: .normal)
        
        purchaseButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        
        safeArea.centerYAnchor.constraint(equalTo: purchaseButton.centerYAnchor).isActive = true
    }
    
    func initThumbnailImage() {
        contentView.widthAnchor.constraint(equalTo: thumbnailImageView.widthAnchor, multiplier: 4).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: -10).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 10).isActive = true
        contentView.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: -10).isActive = true
    }
}
