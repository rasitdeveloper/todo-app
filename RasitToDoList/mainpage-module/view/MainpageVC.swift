//
//  ViewController.swift
//  RasitToDoList
//
//  Created by Rasit on 12.10.2022.
//

import UIKit

class MainpageVC: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoListTableView: UITableView!
    
    var toDoList = [ToDo]()
    
    var mainpagePresenterObject : ViewToPresenterMainpageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
                
        veritabaniKopyala()
        
        MainpageRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainpagePresenterObject?.loadTodo()
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "ztodo", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("ztodo.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch{}
        }
    }
    

    
}


extension MainpageVC : PresenterToViewMainpageProtocol {
    func toView(TodoList: Array<ToDo>) {
        self.toDoList = TodoList
        self.toDoListTableView.reloadData()
    }
}


extension MainpageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainpagePresenterObject?.search(searchedWord: searchText)
    }
}

extension MainpageVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = toDoList[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageListCell", for: indexPath) as! TableViewCellMainPageList
        cell.titleLabel.text = todo.todo_title
        cell.contentLabel.text = todo.todo_content
        cell.initDateLabel.text = "started: \(todo.todo_startdate!)"
        cell.updateDateLabel.text = "updated: \(todo.todo_updatedate!)"
        
        if todo.todo_status == "none" {
            cell.backgroundColor = UIColor.white
            cell.statusLabel.text = todo.todo_status
        } else if todo.todo_status == "complete" {
            cell.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.1)
            cell.statusLabel.text = todo.todo_status
        } else if todo.todo_status == "inprogress" {
            cell.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.15)
            cell.statusLabel.text = "in progress"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDoList[indexPath.section]
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let todo = sender as? ToDo
            let toVC = segue.destination as! ToDoDetailVC
            toVC.todo = todo
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let todo = toDoList[indexPath.section]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,bool) in
            let alert = UIAlertController(title: "Delete Action", message: "Are you sure", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
                
            }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.mainpagePresenterObject?.delete(todo_id: todo.todo_id!)
            }
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

