//
//  LogInView.swift
//  ArchitecturePractice
//
//  Created by Владимир Втулкин on 27.11.2021.
//

import UIKit
import SnapKit

final class  LogInView: UIView {
	var codeButtonTapHandler: (() -> Void)?
	var loginButtonTapHandler: (() -> Void)?
	private let logInButton = UIButton()
	private let getCodeButton = UIButton()
	private let loginTextField = UITextField()
	private let codeTextField = UITextField()

	func configureView() {
		self.backgroundColor = .white
		self.setContent()
		self.addSubviews()
		self.setConstraints()
	}

	private func addSubviews() {
		self.addSubview(self.loginTextField)
		self.addSubview(self.codeTextField)
		self.addSubview(self.getCodeButton)
		self.addSubview(self.logInButton)
	}

	private func setConstraints() {
		self.loginTextField.snp.makeConstraints { maker in
			maker.left.right.equalToSuperview().inset(20)
			maker.top.equalToSuperview().offset(100)
		}

		self.codeTextField.snp.makeConstraints { maker in
			maker.top.equalTo(self.loginTextField.snp.bottom).offset(5)
			maker.left.right.equalToSuperview().inset(20)
		}

		self.getCodeButton.snp.makeConstraints { maker in
			maker.centerX.centerY.equalToSuperview()
			maker.left.right.equalToSuperview().inset(20)
		}

		self.logInButton.snp.makeConstraints { maker in
			maker.left.right.equalToSuperview().inset(20)
			maker.top.equalTo(self.getCodeButton.snp.bottom).offset(20)
		}
	}

	func setContent() {
		self.loginTextField.placeholder = "Write your number"
		self.loginTextField.borderStyle = .roundedRect

		self.codeTextField.placeholder = "Write auth code"
		self.codeTextField.borderStyle = .roundedRect
		self.codeTextField.isHidden = true

		self.getCodeButton.setTitle("Get auth code", for: .normal)
		self.getCodeButton.backgroundColor = .systemGreen
		self.getCodeButton.layer.cornerRadius = 19
		self.getCodeButton.clipsToBounds = true
		self.getCodeButton.addTarget(self, action: #selector(self.codeButtonTap), for: .touchDown)

		self.logInButton.setTitle("Log In", for: .normal)
		self.logInButton.backgroundColor = .systemGreen
		self.logInButton.layer.cornerRadius = 19
		self.logInButton.clipsToBounds = true
		self.logInButton.addTarget(self, action: #selector(self.logInButtonTap), for: .touchDown)
		self.logInButton.isHidden = true
	}

	init() {
		super.init(frame: .zero)
		self.configureView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@objc private func logInButtonTap() {
		self.loginButtonTapHandler?()
	}

	@objc private func codeButtonTap() {
		self.codeButtonTapHandler?()
		self.logInButton.isHidden = false
		self.codeTextField.isHidden = false
	}
}
