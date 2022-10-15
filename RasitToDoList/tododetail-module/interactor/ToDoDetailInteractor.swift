//
//  ToDoDetailInteractor.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class ToDoDetailInteractor : PresenterToInteractorToDoDetailProtocol {
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ztodo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func updateToDo(todo_id: Int, todo_title: String, todo_content: String, todo_status: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let now = dateFormatter.string(from: date)
        
        
        db?.open()
        do {
            try db!.executeUpdate("UPDATE todo SET todo_title = ?, todo_content = ?, todo_update_date = ?, todo_status = ? WHERE todo_id = ?", values: [todo_title,todo_content,now,todo_status,todo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
