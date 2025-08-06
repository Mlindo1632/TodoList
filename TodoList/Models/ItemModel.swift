//
//  ItemModel.swift
//  TodoList
//
//  Created by Lindokuhle Khumalo on 2025/08/06.
//

import Foundation

// If we want to use the struct in a FoeEachLoop, we need to make it confrom to identifiable

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString // Strings are more flexible if we want to put them in a third party database ie, Firebase
    let title: String
    let isCompleted: Bool
    
}
