//
//  ResourseModel.swift
//  ArchitecturePractice
//
//  Created by Владимир Втулкин on 04.12.2021.
//

final class ResourseModel
{	
	private let loginPlaceHolder = "Write your number"
	private let codePlaceHolder = "Write auth code"
	private let codeButtonTitle = "Get auth code"
	private let loginButtonTitle = "Log In"
	private let navTitle = "Log In"
	private let wrongCodePlaceHolder = "Wrong code, do it again"
	
	func getResourse() -> ResourseModelData {
		let data = ResourseModelData(loginPlaceHolder: self.loginPlaceHolder,
									 codePlaceHolder:self.codePlaceHolder,
									 codeButtonTitle: self.codeButtonTitle,
									 loginButtonTitle: self.loginButtonTitle,
									 navTitle: self.navTitle, wrongCodePlaceHolder: nil)
		return data
	}
	
	func getFailureResourse() -> ResourseModelData {
		let data = ResourseModelData(loginPlaceHolder: nil, codePlaceHolder: nil, codeButtonTitle: nil, loginButtonTitle: nil, navTitle: nil, wrongCodePlaceHolder: self.wrongCodePlaceHolder)
		return data
	}
}

struct ResourseModelData
{
	let loginPlaceHolder: String?
	let codePlaceHolder: String?
	let codeButtonTitle: String?
	let loginButtonTitle: String?
	let navTitle: String?
	let wrongCodePlaceHolder: String?
	
}
