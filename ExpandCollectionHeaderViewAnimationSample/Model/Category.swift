//
//  Category.swift
//  ExpandCollectionHeaderViewAnimationSample
//
//  Created by 윤중현 on 2018. 5. 28..
//  Copyright © 2018년 윤중현. All rights reserved.
//

class Category {
    var name: String = ""
    var subCategories: [Category] = []
    
    init() {
        
    }
    
    init(name: String, subCategories: [Category]) {
        self.name = name
        self.subCategories = subCategories
    }
}
