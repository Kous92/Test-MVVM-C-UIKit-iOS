//
//  APIError.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import Foundation

enum APIError: Error {
    case errorMessage(String)
    
    var errorMessageString: String {
        switch self {
        case .errorMessage(let message):
            return message
        }
    }
}
