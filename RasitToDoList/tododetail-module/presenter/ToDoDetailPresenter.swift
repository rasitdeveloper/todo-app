//
//  ToDoDetailPresenter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class ToDoDetailPresenter : ViewToPresenterToDoDetailProtocol {
    
    var ToDoDetailInteractor: PresenterToInteractorToDoDetailProtocol?
    
    func update(todo_id: Int, todo_title: String, todo_content: String, todo_status: String) {
        ToDoDetailInteractor?.updateToDo(todo_id: todo_id, todo_title: todo_title, todo_content: todo_content, todo_status: todo_status)
    }
    
}
