//
//  CategoryFooterView.swift
//  ExpandCollectionHeaderViewAnimationSample
//
//  Created by 윤중현 on 2018. 5. 28..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit

class CategoryFooterView: UICollectionReusableView {
    
    static let Identifier = "CategoryFooterView"
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let openBackgroundColor: UIColor = UIColor.darkGray
    let closeBackgroundColor: UIColor = UIColor.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
    }
    
    func setupView() {
        self.addSubview(self.borderView)
        self.borderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
