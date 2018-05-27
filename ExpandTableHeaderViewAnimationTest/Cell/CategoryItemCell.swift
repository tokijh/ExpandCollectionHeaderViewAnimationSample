//
//  CategoryItemCell.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class CategoryItemCell: UITableViewCell {
    
    static let Identifier = "CategoryItemCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
    }
    
    func setupView() {
        self.contentView.addSubview(self.label)
        self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        self.label.bottomAnchor.constraint(greaterThanOrEqualTo: self.contentView.bottomAnchor, constant: -15).isActive = true
    }
    
    func set(name: String) {
        self.label.text = name
    }
}
