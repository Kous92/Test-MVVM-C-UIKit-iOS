//
//  DetailCoordinator.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 29/03/2023.
//

import Foundation
import UIKit

final class DetailCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController?
    var childCoordinators = [Coordinator]()
    let viewModel: PhoneViewModel
    
    init(navigationController : UINavigationController?, viewModel: PhoneViewModel) {
        print("Initialisation DetailCoordinator")
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    deinit {
        print("DetailCoordinator détruit")
    }
    
    // Définition du point d'entrée
    func start() {
        print("DetailCoordinator: navigation vers la vue détail")
        guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("DetailViewController inexistant, impossible d'afficher la vue détail.")
        }
        
        detailViewController.configure(with: viewModel)
        detailViewController.coordinator = self
        print("DetailViewController prêt.")
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func backToListView() {
        // Dépilage de la vue
        navigationController?.popToRootViewController(animated: true)
        
        // Nettoyage du coordinator enfant
        parentCoordinator?.removeChildCoordinator(childCoordinator: self)
    }
}
