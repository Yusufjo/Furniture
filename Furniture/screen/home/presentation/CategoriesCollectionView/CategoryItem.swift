//
//  CategoryItem.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

struct CategoryItem {
    let imageName: String
    let selectedImageName: String
    let title: String
    var isSelected: Bool = false
    
    init(imageName: String, selectedImageName: String, title: String, isSelected: Bool) {
        self.imageName = imageName
        self.selectedImageName = selectedImageName
        self.title = title
        self.isSelected = isSelected
    }
    
    init(imageName: String, selectedImageName: String, title: String) {
        self.imageName = imageName
        self.selectedImageName = selectedImageName
        self.title = title
    }
    
}
