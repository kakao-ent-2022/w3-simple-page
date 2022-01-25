//
//  HeaderView.swift
//  PageApp
//
//  Created by river.o on 2022/01/25.
//

import UIKit

class HeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
    }
    
    private func addViews() {
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = "Simple Page"
            label.font = UIFont.systemFont(ofSize: 20)
            label.sizeToFit()
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let shopIcon: UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "cart.fill")
            icon.translatesAutoresizingMaskIntoConstraints = false
            return icon
        }()
        
        addSubview(headerLabel)
        addSubview(shopIcon)
        
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        shopIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shopIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        shopIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        shopIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
