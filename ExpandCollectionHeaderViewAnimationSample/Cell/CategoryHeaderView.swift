//
//  CategoryHeaderView.swift
//  ExpandCollectionHeaderViewAnimationSample
//
//  Created by 윤중현 on 2018. 5. 27..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class CategoryHeaderView: UICollectionReusableView {
    
    static let Identifier = "CategoryHeaderView"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    lazy var wrapperView: UIView = { [unowned self] in
        let view = UIView()
        view.addSubview(label)
        self.label.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        return view
    }()
    
    var didTapCellHandler: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapAction)))
    }
    
    func setupView() {
        self.addSubview(self.wrapperView)
        self.wrapperView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func set(name: String, didTapCellHandler: @escaping ()->()) {
        self.label.text = name
        self.didTapCellHandler = didTapCellHandler
    }
    
    @objc func didTapAction() {
        self.didTapCellHandler?()
    }
}
