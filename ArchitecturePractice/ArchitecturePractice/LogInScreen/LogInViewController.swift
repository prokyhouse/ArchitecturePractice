//
//  ViewController.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import UIKit

class LogInViewController: UIViewController
{
	private var authCode: Int?
	
	private lazy var resourseModel = ResourseModel()

	private lazy var loginView: LogInView = {
		let view = LogInView()
		view.configureView(with: self.resourseModel)

		view.loginButtonTapHandler = {[weak self] code in
			self?.checkCode(code: code)
		}

		view.codeButtonTapHandler = {[weak self] in
			self?.showCode()
		}
		return view
	}()
	
	override func loadView() {
		super.loadView()
		self.configureTitle()
		self.view = self.loginView
	}
}

private extension LogInViewController
{
	private func configureTitle() {
		self.navigationItem.title = self.resourseModel.navTitle
	}

	private func checkCode(code: Int) {
		if code == self.authCode {
			self.push()
		} else {
			self.loginView.resetTextField()
		}
	}

	private func push() {
		print("working")
		let feedVC = FeedTableViewController()
		navigationController?.pushViewController(feedVC, animated: true)
	}

	private func showCode() {
		self.authCode = Int(arc4random_uniform(9999))
		guard let code = self.authCode else { return }
		print("Your code: \(code)")
	}
}
