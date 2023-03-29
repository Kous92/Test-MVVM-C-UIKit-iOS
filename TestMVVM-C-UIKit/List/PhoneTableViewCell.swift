//
//  PhoneTableViewCell.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import UIKit

final class PhoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iPhoneImageView: UIImageView!
    @IBOutlet weak var iPhoneNameLabel: UILabel!
    
    func configure(with viewModel: PhoneCellViewModel) {
        iPhoneNameLabel.text = viewModel.name
        iPhoneImageView.loadImage(with: viewModel.imageURL)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset Thumbnail Image View
        iPhoneImageView.image = nil
    }
}
