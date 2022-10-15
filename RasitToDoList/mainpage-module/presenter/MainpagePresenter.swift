//
//  MainpagePresenter.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class MainpagePresenter : ViewToPresenterMainpageProtocol {
    var mainpageInteractor : PresenterToInteractorMainpageProtocol?
    var mainpageView : PresenterToViewMainpageProtocol?
    
    func loadTodo() {
        mainpageInteractor?.getAllToDo()
    }
    
    func search(searchedWord: String) {
        mainpageInteractor?.searchTodo(searchedWord: searchedWord)
    }
    
    func delete(todo_id: Int) {
        mainpageInteractor?.deleteTodo(todo_id: todo_id)
    }
}

extension MainpagePresenter : InteractorToPresenterMainpageProtocol {
    func toPresenter(TodoList: Array<ToDo>) {
        mainpageView?.toView(TodoList: TodoList)
    }
}
