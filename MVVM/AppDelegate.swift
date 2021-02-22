//
//  AppDelegate.swift
//  MVVM
//
//  Created by Mihaela Glavan on 19/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! SignInViewController
        let viewModel = SignInViewModel(user: User(email: "", password: ""))
        viewController.viewModel = viewModel
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

