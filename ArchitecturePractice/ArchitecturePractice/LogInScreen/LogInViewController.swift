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
		let data = self.resourseModel.getResourse()
		view.configureView(with: data)

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
		self.navigationItem.title = self.resourseModel.getResourse().navTitle
	}

	private func checkCode(code: Int) {
		if code == self.authCode {
			self.push()
		} else {
			let data = self.resourseModel.getFailureResourse()
			self.loginView.resetTextField(with: data)
		}
	}

	private func push() {
		print("working")
		let feedVC = FeedTableViewController()
		navigationController?.pushViewController(feedVC, animated: true)
	}

	private func showCode() {
		self.authCode = Int.random(in: 0001...9999)
		guard let code = self.authCode else { return }
		print("Your code: \(code)")
	}
}
