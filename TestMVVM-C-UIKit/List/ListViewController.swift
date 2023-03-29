//
//  ListViewController.swift
//  TestMVVM-C-UIKit
//
//  Created by Koussaïla Ben Mamar on 01/03/2023.
//

import UIKit

final class ListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: AppCoordinator?
    var viewModel: ListViewModel?
    private var iPhoneViewModels = [PhoneViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Liste des iPhones"
        tableView.delegate = self
        tableView.dataSource = self
        setBindings()
        viewModel?.fetchiPhonesData()
    }
    
    func setBindings() {
        viewModel?.error = { [weak self] errorMessage in
            let alert = UIAlertController(title: "Erreur", message: errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                 print("OK")
            }))

            self?.present(alert, animated: true, completion: nil)
        }
        
        viewModel?.success = { [weak self] viewModels in
            self?.iPhoneViewModels = viewModels
            print("OK. \(self?.iPhoneViewModels.count ?? 0) iPhones pour le TableView.")
            self?.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iPhoneViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "iPhoneCell", for: indexPath) as? PhoneTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: iPhoneViewModels[indexPath.row].getPhoneCellViewModel())
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigation vers la vue détail
        coordinator?.goToDetailView(with: iPhoneViewModels[indexPath.row])
    }
}
