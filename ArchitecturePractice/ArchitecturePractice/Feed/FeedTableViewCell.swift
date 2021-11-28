//
//  FeedTableViewCell.swift
//  ArchitecturePractice
//
//  Created by ilya bolotov on 27.11.2021.
//

import UIKit
import SnapKit

class FeedTableViewCell: UITableViewCell {

    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        return img
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
		label.sizeToFit()
		label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
			make.left.top.equalToSuperview().offset(16)
			make.bottom.equalToSuperview().inset(27)
			make.height.equalTo(self.image.snp.width)
		}

		self.titleLabel.snp.makeConstraints { make in
			make.left.equalTo(self.image.snp.right).offset(16)
			make.top.equalToSuperview().offset(16)
			make.right.equalToSuperview().offset(-16)
		}

		self.descriptionLabel.snp.makeConstraints { make in
			make.left.equalTo(self.image.snp.right).offset(16)
			make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
			make.right.equalToSuperview().offset(-16)
			// make.bottom.equalToSuperview().inset(16)
		}
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
