//
//  ListViewModel.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import Foundation

final class ListViewModel {
    private var iPhoneData = [Phone]()
    private var iPhoneViewModels = [PhoneViewModel]()
    private var errorMessage: String = ""
    private let apiService: APIService
    
    // Data binding
    var success: (_ iPhones: [PhoneViewModel]) -> Void = { _ in }
    var error: (_ errorMessage: String) -> Void = { _ in }
    
    // Injection de dépendance pour le mock ou le service réseau
    init(with apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchiPhonesData() {
        Task {
            do {
                iPhoneData = try await apiService.fetchiPhones()
            } catch APIError.errorMessage(let message) {
                errorMessage = message
                await updateViewWithError()
                
                return
            }
            
            print("Données: \(iPhoneData.count), errorMessage = \(errorMessage)")
            print(iPhoneData.map { $0.name })
            
            await parseViewModels()
            await updateView()
        }
    }
    
    private func parseViewModels() async {
        iPhoneData.forEach { iPhoneViewModels.append(PhoneViewModel(iPhone: $0)) }
    }
    
    // @MainActor remplace DispatchQueue.main.async, mais doit être appelé avec await dans un bloc async.
    // Le ViewModel va ici dire à la vue de se mettre à jour, par le biais des closures (data binding)
    @MainActor private func updateView() {
        self.success(iPhoneViewModels)
    }
    
    @MainActor private func updateViewWithError() {
        self.error(errorMessage)
    }
}
