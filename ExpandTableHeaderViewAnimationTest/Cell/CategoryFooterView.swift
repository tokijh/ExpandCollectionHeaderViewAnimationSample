//
//  CategoryFooterView.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 28..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class CategoryFooterView: UITableViewHeaderFooterView {
    
    static let Identifier = "CategoryFooterView"
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
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
        self.contentView.addSubview(self.borderView)
        self.borderView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.borderView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.borderView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        self.borderView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
    }
}
