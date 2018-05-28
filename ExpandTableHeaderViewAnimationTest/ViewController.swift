//
//  ViewController.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
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
        self.collectionView.register(ExtraHeaderCell.self, forCellWithReuseIdentifier: ExtraHeaderCell.Identifier)
        self.collectionView.register(CategoryItemCell.self, forCellWithReuseIdentifier: CategoryItemCell.Identifier)
        self.collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CategoryHeaderView.Identifier)
        self.collectionView.register(CategoryFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: CategoryFooterView.Identifier)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func loadData() {
        self.categories = CategoryService().getCatgories()
        self.openStatus = self.categories.map({ _ in false })
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section != 0 else { return 1 }
        return showingCategories[section - 1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtraHeaderCell.Identifier, for: indexPath) as? ExtraHeaderCell {
            return cell
        } else if indexPath.row < self.categories[indexPath.section - 1].subCategories.count, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemCell.Identifier, for: indexPath) as? CategoryItemCell {
            let category = self.categories[indexPath.section - 1].subCategories[indexPath.row]
            cell.set(name: category.name)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 { return UICollectionReusableView() }
        if kind == UICollectionElementKindSectionHeader, let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeaderView.Identifier, for: indexPath) as? CategoryHeaderView {
            let category = self.categories[indexPath.section - 1]
            cell.set(name: category.name) { [weak self] in
                guard let strongSelf = self else { return }
                let valueSection = indexPath.section - 1
                let newOpenStatus = !strongSelf.openStatus[valueSection]
                strongSelf.openStatus[valueSection] = newOpenStatus
                let categories = strongSelf.categories[valueSection]
                
                let indexPaths = Array(0..<categories.subCategories.count).map({ IndexPath(row: $0, section: indexPath.section) })
                if newOpenStatus {
                    strongSelf.collectionView.performBatchUpdates({
                        strongSelf.collectionView.insertItems(at: indexPaths)
                    }, completion: nil)
                } else {
                    strongSelf.collectionView.performBatchUpdates({
                        strongSelf.collectionView.deleteItems(at: indexPaths)
                    }, completion: nil)
                }
            }
            return cell
        } else if kind == UICollectionElementKindSectionFooter, let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryFooterView.Identifier, for: indexPath) as? CategoryFooterView {
            return cell
        }
        return UICollectionReusableView()
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 { return CGSize(width: collectionView.bounds.width, height: 145) }
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 { return CGSize.zero }
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 { return CGSize.zero }
        return CGSize(width: collectionView.bounds.width, height: 1)
    }
}
