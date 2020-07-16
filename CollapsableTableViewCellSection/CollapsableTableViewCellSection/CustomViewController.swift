//
//  CustomViewController.swift
//  CollapsableTableViewCellSection
//
//  Created by Muhammad Abdullah Al Mamun on 16/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController{

    @IBOutlet weak var customTableiView: UITableView!
    var sections = sectionsData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableiView.delegate  = self
        customTableiView.dataSource = self
        // Auto resizing the height of the cell
        customTableiView.estimatedRowHeight = 44.0
        customTableiView.rowHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension CustomViewController:UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapse ? 0 : sections[section].items?.count ?? 0
        //if collapse then no data means zero else numer of data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        let item: Item = (sections[indexPath.section].items?[indexPath.row]) as! Item
        
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.details
        
        return cell
    }
    
    // Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = customTableiView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? customTableViewHeader ?? customTableViewHeader(reuseIdentifier: "header")
        header.titleLabel.text = sections[section].sectionName
        //header.titleLabel.text = sections[section]
        header.arrowLabel.text = ">"
        //header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

extension CustomViewController:CollapsibleTableViewHeaderDelegate
{
    func toggleSection(_ header: customTableViewHeader, section: Int) {
        //code here
        let collapsed = !sections[section].collapse
               
               // Toggle collapse
        sections[section].collapse = collapsed
              // header.setCollapsed(collapsed)
               
        customTableiView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
    
}
