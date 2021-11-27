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
		let loginView: LogInView = {
			let view = LogInView()
			view.buttonTapHandler = {[weak self] in
				self?.push()
			}
			return view
		}()
		self.view = loginView
		
	}
	

	func push() {
		print("working")
        let feedVC = FeedTableViewController()
        navigationController?.pushViewController(feedVC, animated: true)
	}
}

