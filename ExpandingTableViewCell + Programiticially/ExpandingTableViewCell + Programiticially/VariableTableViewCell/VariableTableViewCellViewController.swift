//
//  VariableTableViewCellViewController.swift
//  ExpandingTableViewCell + Programiticially
//
//  Created by Muhammad Abdullah Al Mamun on 13/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class VariableTableViewCellViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    
    var expandedIndexSet : IndexSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate   = self
        customTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        //focus on AutoLayoutConstant
        
        customTableView.rowHeight = UITableView.automaticDimension
        customTableView.estimatedRowHeight = 220
    }
    
    
    
}

extension VariableTableViewCellViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = customTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VariableTableViewCell else {
            print("failed to get cell")
            return UITableViewCell()
        }
        //assign data
        cell.cellImage.image  = property[indexPath.row].image
        cell.cellLabel.text   = property[indexPath.row].label
        cell.selectionStyle   = .none
        
        cell.cellLabel.numberOfLines = (expandedIndexSet.contains(indexPath.row)) ? 0 : 3
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        customTableView.deselectRow(at: indexPath, animated: true)
        
        if expandedIndexSet.contains(indexPath.row){
            expandedIndexSet.remove(indexPath.row)
        } else{
            expandedIndexSet.insert(indexPath.row)
        }
        
        customTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
