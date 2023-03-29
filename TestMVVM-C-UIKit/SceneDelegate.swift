//
//  SceneDelegate.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 05/02/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // C'est d'ici qu'on démarre l'application et donc ici qu'on démarre avec le coordinator.
        print("Initialisation Coordinator")
        coordinator = AppCoordinator()
        coordinator?.start()
        
        print("Ouverture de la première vue")
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }
}
