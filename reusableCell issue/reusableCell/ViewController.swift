//
//  ViewController.swift
//  reusableCell
//
//  Created by Soulchild on 20/12/2018.
//  Copyright © 2018 fluffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let todoCellIdentifier = "todoCellIdentifier"
    var tasks = [Task](repeating: Task(done: false), count: 100 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.todoTableView.register(UINib(nibName: String(describing: TodoTableViewCell.self), bundle: nil), forCellReuseIdentifier: todoCellIdentifier)
        
        self.todoTableView.dataSource = self
        self.todoTableView.delegate = self
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: todoCellIdentifier, for: indexPath) as! TodoTableViewCell
        
        let task = tasks[indexPath.row]
        if(task.done){
            cell.checkLabel.isHidden = false
        }
        
        cell.taskLabel.text = "Task \(indexPath.row)"
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! TodoTableViewCell
        
        // toggle the check mark label visibility
        cell.checkLabel.isHidden = !cell.checkLabel.isHidden
        
        // toggle the 'done' status of the task
        // and save it back to the array
        var task = tasks[indexPath.row]
        task.done = !task.done
        tasks[indexPath.row] = task
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

