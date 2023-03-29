//
//  APIService.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import Foundation

protocol APIService {
    func fetchiPhones() async throws -> [Phone]
}
