//
//  CategoryHeaderView.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class CategoryHeaderView: UITableViewHeaderFooterView {
    
    static let Identifier = "CategoryHeaderView"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    lazy var wrapperView: UIView = { [unowned self] in
        let view = UIView()
        view.addSubview(label)
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let openBackgroundColor: UIColor = UIColor.darkGray
    let closeBackgroundColor: UIColor = UIColor.white
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
    }
    
    func setupView() {
        self.contentView.addSubview(self.wrapperView)
        self.wrapperView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.wrapperView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.wrapperView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        self.wrapperView.bottomAnchor.constraint(greaterThanOrEqualTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        self.wrapperView.heightAnchor.constraint(equalToConstant: 50)
    }
    
    func set(name: String, isOpen: Bool) {
        self.label.text = name
        set(isOpen: isOpen)
    }
    
    func set(isOpen: Bool) {
        self.contentView.backgroundColor = isOpen ? openBackgroundColor : closeBackgroundColor
    }
}
