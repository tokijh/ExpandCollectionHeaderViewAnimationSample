//
//  ExtraHeaderCell.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class ExtraHeaderCell: UITableViewCell {
    
    static let Identifier = "ExtraHeaderCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "Extra header cell"
        return label
    }()
    
    lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
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
        self.contentView.addSubview(self.colorView)
        
        self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        self.colorView.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 15).isActive = true
        self.colorView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        self.colorView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        self.colorView.bottomAnchor.constraint(greaterThanOrEqualTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.colorView.heightAnchor.constraint(equalToConstant: 100)
    }
}
