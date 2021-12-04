//
//  LogInView.swift
//  ArchitecturePractice
//
//  Created by Владимир Втулкин on 27.11.2021.
//

import UIKit
import SnapKit

final class  LogInView: UIView
{
	var codeButtonTapHandler: (() -> Void)?
	var loginButtonTapHandler: ((Int) -> Void)?
	
	private let logInButton = UIButton()
	private let getCodeButton = UIButton()
	private let loginTextField = UITextField()
	private let codeTextField = UITextField()

	func configureView(with data: ResourseModelData) {
		self.backgroundColor = .white
		self.setContent(data: data)
		self.addSubviews()
		self.setConstraints()
	}
	
	func resetTextField(with data: ResourseModelData) {
		self.codeTextField.text = ""
		self.codeTextField.placeholder = data.wrongCodePlaceHolder
	}

	init() {
		super.init(frame: .zero)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension LogInView
{
	private func addSubviews() {
		self.addSubview(self.loginTextField)
		self.addSubview(self.codeTextField)
		self.addSubview(self.getCodeButton)
		self.addSubview(self.logInButton)
	}

	private func setConstraints() {
		self.loginTextField.snp.makeConstraints { maker in
			maker.left.right.equalToSuperview().inset(16)
			maker.top.equalToSuperview().offset(135)
		}

		self.codeTextField.snp.makeConstraints { maker in
			maker.top.equalTo(self.loginTextField.snp.bottom).offset(9)
			maker.left.right.equalToSuperview().inset(16)
		}

		self.getCodeButton.snp.makeConstraints { maker in
			maker.top.equalTo(self.codeTextField.snp.bottom).offset(100)
			maker.left.right.equalToSuperview().inset(16)
		}

		self.logInButton.snp.makeConstraints { maker in
			maker.left.right.equalToSuperview().inset(16)
			maker.top.equalTo(self.getCodeButton.snp.bottom).offset(16)
		}
	}

	private func setContent(data: ResourseModelData) {
		self.loginTextField.placeholder = data.loginPlaceHolder
		self.loginTextField.borderStyle = .roundedRect

		self.codeTextField.placeholder = data.codePlaceHolder
		self.codeTextField.borderStyle = .roundedRect
		self.codeTextField.isHidden = true

		self.getCodeButton.setTitle(data.codeButtonTitle, for: .normal)
		self.getCodeButton.backgroundColor = .systemGreen
		self.getCodeButton.layer.cornerRadius = 19
		self.getCodeButton.clipsToBounds = true
		self.getCodeButton.addTarget(self, action: #selector(self.codeButtonTap), for: .touchDown)

		self.logInButton.setTitle(data.loginButtonTitle, for: .normal)
		self.logInButton.backgroundColor = .systemGreen
		self.logInButton.layer.cornerRadius = 19
		self.logInButton.clipsToBounds = true
		self.logInButton.addTarget(self, action: #selector(self.logInButtonTap), for: .touchDown)
		self.logInButton.isHidden = true
	}
	
	@objc private func logInButtonTap() {
		guard let text = self.codeTextField.text, let code = Int(text) else { return }
		self.loginButtonTapHandler?(code)
	}

	@objc private func codeButtonTap() {
		self.codeButtonTapHandler?()
		self.logInButton.isHidden = false
		self.codeTextField.isHidden = false
	}
}
