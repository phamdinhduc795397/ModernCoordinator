//
//  SplashViewModel.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import Foundation
import ModernCoordinator

protocol SplashInput {
    func fetchAPI()
}

protocol SplashOutput {
}

protocol SplashViewModelType {
    var input: SplashInput { get }
    var output: SplashOutput { get }
}

extension SplashViewModelType where Self: SplashInput & SplashOutput {
    var input: SplashInput { return self }
    var output: SplashOutput { return self }
}

class SplashViewModel: SplashViewModelType, SplashOutput {
    private var router: StrongRouter<AppRoute>
    
    init(router: StrongRouter<AppRoute>) {
        self.router = router
    }
}

extension SplashViewModel: SplashInput {
    func fetchAPI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.router.trigger(.tabBar)
        }
    }
}
