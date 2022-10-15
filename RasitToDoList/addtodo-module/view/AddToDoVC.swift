//
//  AddToDoVC.swift
//  RasitToDoList
//
//  Created by Rasit on 12.10.2022.
//

import UIKit

class AddToDoVC: UIViewController {
    
    
    @IBOutlet weak var tfAddTitle: UITextField!
    @IBOutlet weak var tvAddContent: UITextView!
    var addToDoPresenterObject:ViewToPresenterAddToDoProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        AddToDoRouter.createModule(ref: self)

    }
    
    @IBAction func buttonAddToDo(_ sender: Any) {
        if let tt = tfAddTitle.text, let tc = tvAddContent.text {
            addToDoPresenterObject?.add(todo_title: tt, todo_content: tc)
        }
        navigationController?.popViewController(animated: true)
    }
    
    

}
