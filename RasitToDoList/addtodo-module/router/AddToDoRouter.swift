//
//  AddToDoRouter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class AddToDoRouter : PresenterToRouterAddToDoProtocol {
    static func createModule(ref: AddToDoVC) {
        ref.addToDoPresenterObject = AddToDoPresenter()
        ref.addToDoPresenterObject?.addTodoInteractor = AddToDoInteractor()
    }
}
