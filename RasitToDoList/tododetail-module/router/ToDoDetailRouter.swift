//
//  ToDoDetailRouter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class ToDoDetailRouter : PresenterToRouterToDoDetailProtocol {
    static func createModule(ref: ToDoDetailVC) {
        ref.ToDoDetailPresenterObject = ToDoDetailPresenter()
        ref.ToDoDetailPresenterObject?.ToDoDetailInteractor = ToDoDetailInteractor()
    }
}
