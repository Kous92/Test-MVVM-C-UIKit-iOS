//
//  ImageLoader.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 02/03/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    // Téléchargement asynchrone de l'image
    // Avec Kingfisher, c'est asynchrone, rapide et efficace. Le cache est géré automatiquement.
    func loadImage(with url: String) {
        self.image = nil
        let defaultImage = UIImage(systemName: "iphone")
        
        guard !url.isEmpty, let imageURL = URL(string: url) else {
            self.image = defaultImage
            return
        }
        
        let resource = ImageResource(downloadURL: imageURL)
        self.kf.indicatorType = .activity // Indicateur pendant le téléchargement
        self.kf.setImage(with: resource, placeholder: defaultImage, options: [.transition(.fade(0.5))])
    }
    
    // Indispenable pour optimiser les performances lors du scroll d'un TableView
    func cancelDownloadTask() {
        self.kf.cancelDownloadTask()
        self.image = nil
    }
}
