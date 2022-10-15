//
//  MainpageProtocols.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

protocol ViewToPresenterMainpageProtocol {
    var mainpageInteractor:PresenterToInteractorMainpageProtocol? {get set}
    var mainpageView:PresenterToViewMainpageProtocol? {get set}
    
    func loadTodo()
    func search(searchedWord:String)
    func delete(todo_id:Int)
}

protocol PresenterToInteractorMainpageProtocol {
    var mainpagePresenter:InteractorToPresenterMainpageProtocol? {get set}
    
    func getAllToDo()
    func searchTodo(searchedWord:String)
    func deleteTodo(todo_id:Int)
}

protocol InteractorToPresenterMainpageProtocol {
    func toPresenter(TodoList:Array<ToDo>)
}

protocol PresenterToViewMainpageProtocol {
    func toView(TodoList:Array<ToDo>)
}

protocol PresenterToRouterMainpageProtocol {
    static func createModule(ref:MainpageVC)
}
