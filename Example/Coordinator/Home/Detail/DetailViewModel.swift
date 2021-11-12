//
//  DetailViewModel.swift
//  Demo
//
//  Created by DucPD on 02/11/2021.
//

import Foundation
import ModernCoordinator

protocol DetailInput {
    func back()
}

protocol DetailOutput {
}

protocol DetailViewModelType {
    var input: DetailInput { get }
    var output: DetailOutput { get }
}

extension DetailViewModelType where Self: DetailInput & DetailOutput {
    var input: DetailInput { return self }
    var output: DetailOutput { return self }
}

final class DetailViewModel: DetailViewModelType, DetailOutput {
    private var router: StrongRouter<HomeRoute>
    
    init(router: StrongRouter<HomeRoute>) {
        self.router = router
    }
}

extension DetailViewModel: DetailInput {
    func back() {
        router.trigger(.back)
    }
    
}
