//
//  BlogPostView.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import Foundation
import UIKit

final class BlogPostView: UIView {
	private weak var controller: BlogPostViewController?

	func configView() {
	}

	func loadView(controller: BlogPostViewController) {
		self.controller = controller
	}
}
