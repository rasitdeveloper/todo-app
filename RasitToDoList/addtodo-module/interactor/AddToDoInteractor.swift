//
//  AddToDoInteractor.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class AddToDoInteractor : PresenterToInteractorAddToDoProtocol {
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ztodo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func addToDo(todo_title: String, todo_content: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let now = dateFormatter.string(from: date)
        
        
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todo (todo_title,todo_content,todo_init_date,todo_update_date,todo_status) VALUES (?,?,?,?,?)", values: [todo_title,todo_content,now,now,"none"])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
