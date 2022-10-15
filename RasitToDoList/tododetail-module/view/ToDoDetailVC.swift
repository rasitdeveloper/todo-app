//
//  ToDoDetailVC.swift
//  RasitToDoList
//
//  Created by Rasit on 12.10.2022.
//

import UIKit

class ToDoDetailVC: UIViewController {
    
    
    @IBOutlet weak var tfDetailTitle: UITextField!
    @IBOutlet weak var tvDetailContent: UITextView!
    @IBOutlet weak var statusButtonOutlet: UIBarButtonItem!
    
    var todo:ToDo?
    var ToDoDetailPresenterObject:ViewToPresenterToDoDetailProtocol?
    var status = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let t = todo {
            tfDetailTitle.text = t.todo_title
            tvDetailContent.text = t.todo_content
            
            self.status = String(t.todo_status!)
            
            if self.status == "none" {
                statusButtonOutlet.tintColor = UIColor.systemIndigo
                // statusButtonOutlet.title = "none"
            } else if self.status == "complete" {
                // statusButtonOutlet.title = "complete"
                statusButtonOutlet.tintColor = UIColor.systemGreen
            } else if self.status == "inprogress" {
                // tatusButtonOutlet.title = "in progress"
                statusButtonOutlet.tintColor = UIColor.systemYellow
            }
        }
        
        ToDoDetailRouter.createModule(ref: self)
        
    }
    
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let t = todo,let tt = tfDetailTitle.text,let tc = tvDetailContent.text {
            ToDoDetailPresenterObject?.update(todo_id: t.todo_id!, todo_title: tt, todo_content: tc, todo_status: self.status)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func statusButton(_ sender: Any) {
        if self.status == "none" {
            self.status = "complete"
            // statusButtonOutlet.title = "complete"
            // statusButtonOutlet.tintColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.1)
            statusButtonOutlet.tintColor = UIColor.systemGreen
        } else if self.status == "complete" {
            self.status = "inprogress"
            // statusButtonOutlet.title = "in progress"
            // statusButtonOutlet.tintColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.1)
            statusButtonOutlet.tintColor = UIColor.systemYellow
        } else if self.status == "inprogress" {
            self.status = "none"
            // statusButtonOutlet.title = "none"
            // statusButtonOutlet.tintColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
            statusButtonOutlet.tintColor = UIColor.systemIndigo
        }
    }
    
}
