//
//  DetailViewController.swift
//  ModernCoordinator
//
//  Created by DucPD on 02/11/2021.
//

import UIKit

class DetailViewController: UIViewController {
    var viewModel: DetailViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        viewModel.input.back()
    }
}
