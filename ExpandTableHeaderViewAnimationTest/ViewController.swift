//
//  ViewController.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category] = []
    var openStatus: [Bool] = []
    var showingCategories: [[Category]] {
        return zip(self.categories, self.openStatus)
            .map({ $0.1 ? $0.0.subCategories : [] })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        self.tableView.register(ExtraHeaderCell.self, forCellReuseIdentifier: ExtraHeaderCell.Identifier)
        self.tableView.register(CategoryItemCell.self, forCellReuseIdentifier: CategoryItemCell.Identifier)
        self.tableView.register(CategoryHeaderView.self, forHeaderFooterViewReuseIdentifier: CategoryHeaderView.Identifier)
        self.tableView.register(CategoryFooterView.self, forHeaderFooterViewReuseIdentifier: CategoryFooterView.Identifier)
        
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func loadData() {
        self.categories = CategoryService().getCatgories()
        self.openStatus = self.categories.map({ _ in false })
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 0 else { return 1 }
        return showingCategories[section - 1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0,
            let cell = tableView.dequeueReusableCell(withIdentifier: ExtraHeaderCell.Identifier, for: indexPath) as? ExtraHeaderCell {
            return cell
        } else if indexPath.row < self.categories[indexPath.section - 1].subCategories.count,
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemCell.Identifier, for: indexPath) as? CategoryItemCell {
            let category = self.categories[indexPath.section - 1].subCategories[indexPath.row]
            cell.set(name: category.name)
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.Identifier) as? CategoryHeaderView else { return nil }
        let category = self.categories[section - 1]
        let isOpen = self.openStatus[section - 1]
        cell.set(name: category.name, isOpen: isOpen) { [weak self, weak cell] in
            guard let strongSelf = self else { return }
            let valueSection = section - 1
            let newOpenStatus = !strongSelf.openStatus[valueSection]
            strongSelf.openStatus[valueSection] = newOpenStatus
            let categories = strongSelf.categories[valueSection]
            
            let indexPaths = Array(0..<categories.subCategories.count).map({ IndexPath(row: $0, section: section) })
            if newOpenStatus {
                strongSelf.tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.fade)
            } else {
                strongSelf.tableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.fade)
            }
            cell?.set(isOpen: newOpenStatus)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryFooterView.Identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 1
    }
}
