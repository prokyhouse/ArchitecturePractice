//
//  BlogPostModel.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import Foundation

final class BlogPostModel {
	private var imageName: String?
	private var title: String?
	private var author: String?
	private var text: String?

	func setData(imageName: String, title: String, author: String, text: String) {
		self.imageName = imageName
		self.title = title
		self.author = author
		self.text = text
	}

	func getImageName() -> String {
		guard let imageName = self.imageName else {
			return "DefaultImage"
		}
		return imageName
	}

	func getTitle() -> String {
		guard let title = self.title else {
			return "Нет заголока"
		}
		return title
	}

	func getAuthor() -> String {
		guard let author = self.author else {
			return "нет автора"
		}
		return author
	}

	func getText() -> String {
		guard let text = self.text else {
			return "Текст отсутствует"
		}
		return text
	}
}
