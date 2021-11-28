//
//  SceneDelegate.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		self.window = window
		window.rootViewController = UINavigationController(rootViewController: LogInViewController())
		window.makeKeyAndVisible()
	}

}
