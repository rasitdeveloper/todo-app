//
//  MainpageRouter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class MainpageRouter : PresenterToRouterMainpageProtocol {
    static func createModule(ref: MainpageVC) {
        let presenter = MainpagePresenter()
        ref.mainpagePresenterObject = presenter
        ref.mainpagePresenterObject?.mainpageInteractor = MainpageInteractor()
        ref.mainpagePresenterObject?.mainpageView = ref
        ref.mainpagePresenterObject?.mainpageInteractor?.mainpagePresenter = presenter
    }
    
}
