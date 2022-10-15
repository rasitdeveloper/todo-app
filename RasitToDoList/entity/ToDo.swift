//
//  ToDo.swift
//  RasitToDoList
//
//  Created by Rasit on 13.10.2022.
//

import Foundation

class ToDo {
    var todo_id:Int?
    var todo_title:String?
    var todo_content:String?
    var todo_startdate:String?
    var todo_updatedate:String?
    var todo_status:String?
    
    init(todo_id: Int, todo_title: String, todo_content: String, todo_startdate: String, todo_updatedate: String, todo_status: String) {
        self.todo_id = todo_id
        self.todo_title = todo_title
        self.todo_content = todo_content
        self.todo_startdate = todo_startdate
        self.todo_updatedate = todo_updatedate
        self.todo_status = todo_status
    }
}
