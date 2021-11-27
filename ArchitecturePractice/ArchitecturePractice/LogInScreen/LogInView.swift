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
	
	var buttonTapHandler: (()-> Void)?
	private let logInButton = UIButton()

	func configureView() {
		self.setContent()
		self.backgroundColor = .orange
	
		self.addSubview(self.logInButton)
		self.logInButton.snp.makeConstraints { maker in
			maker.centerX.centerY.equalToSuperview()
		}
	}
	
	func setContent() {
		self.logInButton.setTitle("Log In", for: .normal)
		self.logInButton.addTarget(self, action: #selector(self.logInButtonTap), for: .allTouchEvents)
		
	}
	
	init() {
		super.init(frame: .zero)
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func logInButtonTap() {
		self.buttonTapHandler?()
	}
}
