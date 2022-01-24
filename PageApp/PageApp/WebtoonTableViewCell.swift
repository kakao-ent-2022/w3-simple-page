//
//  WebtoonTableViewCell.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import UIKit

class WebtoonTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(webtoonViewModel: WebtoonViewModel) {
        titleLabel.text = webtoonViewModel.title
        authorLabel.text = webtoonViewModel.author
        thumbnail.image = webtoonViewModel.image
    }

}
