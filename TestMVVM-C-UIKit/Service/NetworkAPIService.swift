//
//  NetworkAPIService.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import Foundation

final class NetworkAPIService: APIService {
    
    private let endpointURL: String
    
    init() {
        self.endpointURL = "https://kous92.github.io/iPhone-data-test-json/db.json"
    }
    
    func fetchiPhones() async throws -> [Phone] {
        guard let url = URL(string: endpointURL) else {
            print("URL invalide.")
            throw APIError.errorMessage("URL invalide.")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        print(url.absoluteString)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.errorMessage("Pas de réponse du serveur.")
        }
        
        guard httpResponse.statusCode == 200 else {
            print("Erreur code \(httpResponse.statusCode).")
            throw APIError.errorMessage("Erreur code \(httpResponse.statusCode).")
        }
        
        print("Code: \(httpResponse.statusCode)")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var iPhoneData = [Phone]()
        
        do {
            let output = try decoder.decode(PhoneResponse.self, from: data)
            iPhoneData = output.phones
            // iPhoneData.append(try decoder.decode(Phone.self, from: data))
        } catch {
            throw APIError.errorMessage("Erreur lors du décodage.")
        }
        
        // print(iPhoneData)
        return iPhoneData
        
    }
}
