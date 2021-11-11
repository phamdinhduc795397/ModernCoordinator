//
//  HomeViewController.swift
//  Demo
//
//  Created by DucPD on 02/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel: HomeViewModelType!
    
    // MARK:- IBActions
    
    @IBAction func detailTapped(_ sender: UIButton) {
        viewModel.input.toDetail()
    }

}
