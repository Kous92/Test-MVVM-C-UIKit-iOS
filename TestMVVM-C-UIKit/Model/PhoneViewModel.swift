//
//  PhoneViewModel.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 02/03/2023.
//

import Foundation

struct PhoneViewModel {
    let iPhone: Phone
    
    init(iPhone: Phone) {
        self.iPhone = iPhone
    }
    
    func getPhoneCellViewModel() -> PhoneCellViewModel {
        return PhoneCellViewModel(name: iPhone.name, imageURL: iPhone.imageURL)
    }
    
    func getChipDetails() -> String {
        let chip = iPhone.details.chip
        var chipString = "Puce: \(chip.name)\n"
        chipString += "   • Architecture: \(chip.architecture)\n"
        chipString += "   • Cœurs: \(chip.cores)\n"
        chipString += "   • RAM: \(chip.ram)"
        
        return chipString
    }
    
    func getOperatingSystems() -> String {
        let iOS = iPhone.details.operatingSystems
        
        return "\(iOS[0]) à \(iOS[1])"
    }
}

struct PhoneCellViewModel {
    let name: String
    let imageURL: String
    
    init(name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
    }
}
