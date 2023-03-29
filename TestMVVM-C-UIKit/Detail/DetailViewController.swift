//
//  DetailViewController.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var viewModel: PhoneViewModel?
    weak var coordinator: DetailCoordinator?
    
    @IBOutlet weak var iPhoneNameLabel: UILabel!
    @IBOutlet weak var iPhoneImageView: UIImageView!
    @IBOutlet weak var iPhoneYearLabel: UILabel!
    @IBOutlet weak var iPhoneStorageLabel: UILabel!
    @IBOutlet weak var iPhoneChipLabel: UILabel!
    @IBOutlet weak var iPhoneiOSversionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        coordinator?.backToListView()
    }
    
    func configure(with viewModel: PhoneViewModel) {
        self.viewModel = viewModel
    }
    
    private func setViews() {
        iPhoneNameLabel.text = viewModel?.iPhone.name
        iPhoneImageView.loadImage(with: viewModel?.iPhone.details.fullScreenImageURL ?? "")
        iPhoneYearLabel.text = "Année de sortie: \(viewModel?.iPhone.details.year ?? "")"
        iPhoneStorageLabel.text = "Capacités de stockage: \(viewModel?.iPhone.details.storageCapacities.joined(separator: ", ") ?? "")"
        iPhoneChipLabel.text = viewModel?.getChipDetails()
        iPhoneiOSversionsLabel.text = viewModel?.getOperatingSystems()
    }
}
