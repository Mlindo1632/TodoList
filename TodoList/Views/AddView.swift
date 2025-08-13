//
//  AddView.swift
//  TodoList
//
//  Created by Lindokuhle Khumalo on 2025/08/05.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldItem = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add items here...", text: $textFieldItem)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.init(#colorLiteral(red: 0.921, green: 0.921, blue: 0.921, alpha: 1)))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(15)
        }
        .navigationTitle("Add an item 🖊")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldItem)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        switch listViewModel.validate(text: textFieldItem) {
        case .valid:
            return true
        case .tooShort:
            alertTitle = "Your todo item must be at least 3 characters long!"
        case .containsHarmfulWord:
            alertTitle = "Such words are prohibited in this app"
        }
        showAlert = true
        return false
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
