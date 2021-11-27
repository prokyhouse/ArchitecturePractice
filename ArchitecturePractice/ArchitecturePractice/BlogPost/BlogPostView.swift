//
//  BlogPostView.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import Foundation
import UIKit
import SnapKit

final class BlogPostView: UIView {
	private weak var controller: BlogPostViewController?

	private lazy var imageBlock: UIImageView = {
		let obj = UIImageView()
		obj.backgroundColor = .gray
		obj.layer.cornerRadius = 8
		return obj
	}()

	private lazy var title: UILabel = {
		let obj = UILabel()
		obj.font = UIFont.systemFont(ofSize: 30, weight: .medium)
		obj.numberOfLines = 1
		obj.adjustsFontSizeToFitWidth = true
		obj.textAlignment = .left
		return obj
	}()

	private lazy var author: UILabel = {
		let obj = UILabel()
		obj.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		obj.numberOfLines = 1
		obj.adjustsFontSizeToFitWidth = true
		obj.textAlignment = .left
		return obj
	}()

	private lazy var text: UILabel = {
		let obj = UILabel()
		obj.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		obj.numberOfLines = 1
		obj.adjustsFontSizeToFitWidth = true
		obj.textAlignment = .left
		return obj
	}()

	func configure() {
		self.addSubviews()
		self.setConstraints()
	}

	private func addSubviews() {
		self.addSubview(self.imageBlock)
		self.addSubview(self.title)
		self.addSubview(self.author)
		self.addSubview(self.text)
	}

	private func setConstraints() {
		self.imageBlock.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(16)
			make.top.equalTo(self.snp.top).offset(76)
		}

		self.title.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(16)
			make.top.equalTo(self.imageBlock.snp.bottom).offset(32)

			make.height.lessThanOrEqualTo(29)
		}

		self.author.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(16)
			make.top.equalTo(self.title.snp.bottom).offset(8)

			make.height.lessThanOrEqualTo(19)
		}

		self.text.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(16)
			make.top.equalTo(self.author.snp.bottom).offset(16)
			make.bottom.equalTo(self.snp.bottom).offset(-16)
		}
	}

	func loadView(controller: BlogPostViewController) {
		self.controller = controller
	}

	func update(imageName: String, title: String?, author: String?, text: String?) {
		self.imageBlock.image = UIImage(named: imageName)
		self.title.text = title
		self.author.text = author
		self.text.text = text
	}
}
