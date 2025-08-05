//
//  AddView.swift
//  TodoList
//
//  Created by Lindokuhle Khumalo on 2025/08/05.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldItem = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add items here...", text: $textFieldItem)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.init(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    
                .cornerRadius(10)
                
                Button {
                    
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
            .padding(14)
        }
        .navigationTitle("Add an item 🖊")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
