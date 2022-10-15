//
//  AddToDoProtocols.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

protocol ViewToPresenterAddToDoProtocol {
    var addTodoInteractor:PresenterToInteractorAddToDoProtocol? {get set}
    
    func add(todo_title:String,todo_content:String)
}

protocol PresenterToInteractorAddToDoProtocol {
    func addToDo(todo_title:String,todo_content:String)
}

protocol PresenterToRouterAddToDoProtocol {
    static func createModule(ref: AddToDoVC)
}
