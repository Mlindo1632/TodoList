//
//  ListViewModel.swift
//  TodoList
//
//  Created by Lindokuhle Khumalo on 2025/08/06.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second title!", isCompleted: true),
            ItemModel(title: "This is the third title!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func containsHarmfulWord(_ text: String) -> Bool {
        let harmfulWords = ["kill", "murder", "incriminate"]
        let lowercasedText = text.lowercased()
        return harmfulWords.contains { lowercasedText.contains($0) }
    }

    
    enum ValidationResult {
        case valid
        case tooShort
        case containsHarmfulWord
    }
        
    func validate(text: String) -> ValidationResult {
        if text.count < 3 {
            return .tooShort
        } else if containsHarmfulWord(text) {
            return .containsHarmfulWord
        }
        return .valid
    }

    
}
