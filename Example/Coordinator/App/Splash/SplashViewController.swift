//
//  SplashViewController.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import UIKit

class SplashViewController: UIViewController {
    var viewModel: SplashViewModelType!
    
    override func viewDidLoad() {
        viewModel.input.fetchAPI()
    }
    
}
