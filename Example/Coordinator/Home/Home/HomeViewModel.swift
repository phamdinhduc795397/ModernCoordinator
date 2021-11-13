//
//  HomeViewModel.swift
//  ModernCoordinator
//
//  Created by DucPD on 02/11/2021.
//
import Foundation
import ModernCoordinator

protocol HomeInput {
    func toDetail()
}

protocol HomeOutput {
}

protocol HomeViewModelType {
    var input: HomeInput { get }
    var output: HomeOutput { get }
}

extension HomeViewModelType where Self: HomeInput & HomeOutput {
    var input: HomeInput { return self }
    var output: HomeOutput { return self }
}

final class HomeViewModel: HomeViewModelType, HomeOutput {
    private var router: StrongRouter<HomeRoute>

    init(router: StrongRouter<HomeRoute>) {
        self.router = router
    }
}

extension HomeViewModel: HomeInput {
    func toDetail() {
        router.trigger(.detail)
    }
}
