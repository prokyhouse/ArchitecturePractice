//
//  FeedTableViewCell.swift
//  ArchitecturePractice
//
//  Created by ilya bolotov on 27.11.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        //    img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        
        image.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        image.widthAnchor.constraint(equalToConstant:50).isActive = true
        image.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.image.leadingAnchor, constant: 100).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:self.image.leadingAnchor, constant: 100).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(with feed: Feed) {
        image.image = UIImage(named: feed.image)
        titleLabel.text = feed.title
        descriptionLabel.text = feed.description
    }
}
