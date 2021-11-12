//
//  HomeCoordinator.swift
//  CleanArchitecture
//
//  Created by DucPD on 08/11/2021.
//

import UIKit
import ModernCoordinator

enum HomeRoute: Route {    
    case home
    case detail
    case back
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController, initialRoute: .home)
    }

    override func prepareTransition(for route: HomeRoute) {
        switch route {
        case .home:
            let homeVC = HomeViewController()
            homeVC.viewModel = HomeViewModel(router: strongRouter)
            transition.push(homeVC)
        case .detail:
            let homeVC = DetailViewController()
            homeVC.viewModel = DetailViewModel(router: strongRouter)
            transition.push(homeVC)
        case .back:
            transition.pop()
        }
    }
}
