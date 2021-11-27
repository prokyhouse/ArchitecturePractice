//
//  ViewController.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import UIKit

class LogInViewController: UIViewController {
	
	override func loadView() {
		super.loadView()
		self.configureTitle()
		let loginView: LogInView = {
			let view = LogInView()
			view.loginButtonTapHandler = {[weak self] in
				self?.push()
			}
			view.codeButtonTapHandler = {[weak self] in
				self?.showCode()
			}
			return view
		}()
		self.view = loginView
		
	}
	
	func configureTitle() {
		self.navigationItem.title = "Log In"
	}
	

	func push() {
		print("working")
        let feedVC = FeedTableViewController()
        navigationController?.pushViewController(feedVC, animated: true)
	}
	
	func showCode() {
		print("Your code: 1234")
	}
}

