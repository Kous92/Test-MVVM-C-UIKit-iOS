//
//  Coordinator.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 05/02/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    // Ajout d'un coordinator enfant au parent, le parent aura une référence sur le coordinator enfant
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    // Supprime un coordinator enfant depuis le parent
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }

}
