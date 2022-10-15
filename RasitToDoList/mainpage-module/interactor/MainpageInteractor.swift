//
//  MainpageInteractor.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class MainpageInteractor : PresenterToInteractorMainpageProtocol {
    
    var  mainpagePresenter: InteractorToPresenterMainpageProtocol?
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ztodo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func getAllToDo() {
        var list = [ToDo]()
        
        db?.open()
        do {
            let td = try db!.executeQuery("SELECT * FROM todo", values: nil)
            while td.next() {
                let todo = ToDo(todo_id: Int(td.string(forColumn: "todo_id"))!, todo_title: td.string(forColumn: "todo_title")!, todo_content: td.string(forColumn: "todo_content")!, todo_startdate: td.string(forColumn: "todo_init_date")!, todo_updatedate: td.string(forColumn: "todo_update_date")!, todo_status: td.string(forColumn: "todo_status"))
                list.append(todo)
            }
            mainpagePresenter?.toPresenter(TodoList: list)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func searchTodo(searchedWord: String) {
        var list = [ToDo]()
        
        db?.open()
        do {
            let td = try db!.executeQuery("SELECT * FROM todo WHERE todo_title like '%\(searchedWord)%' OR todo_content like '%\(searchedWord)%'", values: nil)
            while td.next() {
                let todo = ToDo(todo_id: Int(td.string(forColumn: "todo_id"))!, todo_title: td.string(forColumn: "todo_title")!, todo_content: td.string(forColumn: "todo_content")!, todo_startdate: td.string(forColumn: "todo_init_date")!, todo_updatedate: td.string(forColumn: "todo_update_date"), todo_status: td.string(forColumn: "todo_status")!)
                list.append(todo)
            }
            mainpagePresenter?.toPresenter(TodoList: list)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteTodo(todo_id: Int) {
    
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM todo WHERE todo_id = ?", values: [todo_id])
            getAllToDo()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}
