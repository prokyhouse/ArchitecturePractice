//
//  FeedTableViewCell.swift
//  ArchitecturePractice
//
//  Created by ilya bolotov on 27.11.2021.
//

import UIKit
import SnapKit

class FeedTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let defaultImage = "1.jpg"
        
        static let imageCornerRadius: CGFloat = 8
        static let boldSystemFont: CGFloat = 19
        static let numberOfLines = 2
        static let systemFont: CGFloat = 14
        
        static let topConstraint: CGFloat = 16
        static let leftConstraint: CGFloat = 16
        static let rightConstraint: CGFloat = -16
        static let topDescriptionConstraint: CGFloat = 8
        static let bottomImageConstraint: CGFloat = 27
        
    }

    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = Constants.imageCornerRadius
        img.clipsToBounds = true
        return img
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.boldSystemFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.numberOfLines
		label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: Constants.systemFont, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)

		self.setConstraints()
    }

	private func setConstraints() {
		self.image.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(Constants.leftConstraint)
            make.bottom.equalToSuperview().inset(Constants.bottomImageConstraint)
			make.height.equalTo(self.image.snp.width)
		}

		self.titleLabel.snp.makeConstraints { make in
			make.left.equalTo(self.image.snp.right).offset(Constants.leftConstraint)
            make.top.equalToSuperview().offset(Constants.topConstraint)
			make.right.equalToSuperview().offset(Constants.rightConstraint)
		}

		self.descriptionLabel.snp.makeConstraints { make in
			make.left.equalTo(self.image.snp.right).offset(Constants.leftConstraint)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Constants.topDescriptionConstraint)
			make.right.equalToSuperview().offset(Constants.rightConstraint)
		}
	}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup(with feed: Feed) {
        image.image = UIImage(named: feed.image ?? Constants.defaultImage)
        titleLabel.text = feed.title
        descriptionLabel.text = feed.description
    }
}
