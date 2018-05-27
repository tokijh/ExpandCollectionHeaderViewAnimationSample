//
//  CategoryService.swift
//  ExpandTableHeaderViewAnimationTest
//
//  Created by 윤중현 on 2018. 5. 28..
//  Copyright © 2018년 윤중현. All rights reserved.
//

class CategoryService {
    func getCatgories() -> [Category] {
        return [
            Category(name: "Section 0", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
                Category(name: "Row 4", subCategories: []),
            ]),
            Category(name: "Section 1", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
                Category(name: "Row 4", subCategories: []),
            ]),
            Category(name: "Section 2", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
                Category(name: "Row 4", subCategories: []),
                Category(name: "Row 5", subCategories: []),
                Category(name: "Row 6", subCategories: []),
                Category(name: "Row 7", subCategories: []),
                Category(name: "Row 8", subCategories: []),
            ]),
            Category(name: "Section 3", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
                Category(name: "Row 4", subCategories: []),
                Category(name: "Row 5", subCategories: []),
                Category(name: "Row 6", subCategories: []),
            ]),
            Category(name: "Section 4", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
            ]),
            Category(name: "Section 5", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
            ]),
            Category(name: "Section 6", subCategories: [
                Category(name: "Row 0", subCategories: []),
                Category(name: "Row 1", subCategories: []),
                Category(name: "Row 2", subCategories: []),
                Category(name: "Row 3", subCategories: []),
                Category(name: "Row 4", subCategories: []),
                Category(name: "Row 5", subCategories: []),
                Category(name: "Row 6", subCategories: []),
                Category(name: "Row 7", subCategories: []),
                Category(name: "Row 8", subCategories: []),
            ])
        ]
    }
}
