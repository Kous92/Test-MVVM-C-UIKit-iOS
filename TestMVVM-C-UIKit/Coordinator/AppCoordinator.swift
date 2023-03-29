//
//  AppCoordinator.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 05/02/2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var navigationController: UINavigationController?
    var childCoordinators = [Coordinator]()
    
    init() {
        
    }
    
    // Définition du point d'entrée
    func start() {
        guard let listViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else {
            fatalError("ListViewController inexistant, démarrage impossible.")
        }
        
        listViewController.viewModel = ListViewModel(with: NetworkAPIService())
        listViewController.coordinator = self
        self.navigationController = UINavigationController(rootViewController: listViewController)
        print("ListViewController prêt.")
        navigationController?.setViewControllers([listViewController], animated: false)
    }
    
    
    func goToDetailView(with viewModel: PhoneViewModel) {
        // La transition est séparée ici dans un sous-flux
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, viewModel: viewModel)
        
        // Ajout du lien vers le parent avec self
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        
        // On transite de l'écran liste à l'écran détail
        detailCoordinator.start()
    }
}
