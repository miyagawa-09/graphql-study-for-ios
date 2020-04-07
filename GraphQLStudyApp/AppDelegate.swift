//
//  AppDelegate.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/03.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let pokemonListViewController = UIStoryboard(name: "PokemonList", bundle: nil).instantiateInitialViewController() as! PokemonListViewController

// 後ほど削除
//        let storyboad = UIStoryboard(name: "PokemonList", bundle: nil)
//        let pokemonListViewController = storyboad.instantiateViewController(withIdentifier: "PokemonList")
        
//        let navigationController = UINavigationController(rootViewController: pokemonListViewController)
//
//        let presenter = PokemonListPresenter()
//        pokemonListViewController.inject(presenter: presenter)
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

