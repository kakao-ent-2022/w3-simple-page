//
//  ContentBasicCell.swift
//  PageApp
//
//  Created by river.o on 2022/01/26.
//

import UIKit

class ContentBasicCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
