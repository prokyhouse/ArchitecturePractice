//
//  BlogPostViewController.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import UIKit

final class BlogPostViewController: UIViewController {
	private var blogPostView: BlogPostView?
	private var blogPostModel: BlogPostModel?

	init() {
		self.blogPostView = BlogPostView(frame: UIScreen.main.bounds)
		self.blogPostModel = BlogPostModel()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		super.loadView()
		self.blogPostView?.loadView(controller: self)
		self.updateData()
	}

	private func updateData() {
		guard
			let dataModel = self.blogPostModel
		else {
			return
		}

		self.blogPostView?.update(imageName: dataModel.getImageName(),
								  title: dataModel.getTitle(),
								  author: dataModel.getAuthor(),
								  text: dataModel.getText())
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		self.blogPostView?.configure()
		self.blogPostView?.backgroundColor = .white
		if let blogPostView = blogPostView {
			self.view.addSubview(blogPostView)
		}
	}
}
