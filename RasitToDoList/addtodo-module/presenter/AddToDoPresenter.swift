//
//  AddToDoPresenter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class AddToDoPresenter : ViewToPresenterAddToDoProtocol {
    var addTodoInteractor: PresenterToInteractorAddToDoProtocol?
    
    func add(todo_title: String, todo_content: String) {
        addTodoInteractor?.addToDo(todo_title: todo_title, todo_content: todo_content)
    }
}
