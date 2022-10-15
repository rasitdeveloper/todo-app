//
//  ToDoDetailProtocols.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

protocol ViewToPresenterToDoDetailProtocol {
    var ToDoDetailInteractor:PresenterToInteractorToDoDetailProtocol? {get set}
    
    func update(todo_id:Int,todo_title:String,todo_content:String,todo_status:String)
}

protocol PresenterToInteractorToDoDetailProtocol {
    func updateToDo(todo_id:Int,todo_title:String,todo_content:String,todo_status:String)
}

protocol PresenterToRouterToDoDetailProtocol {
    static func createModule(ref: ToDoDetailVC)
}
