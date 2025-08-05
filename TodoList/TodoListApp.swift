//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lindokuhle Khumalo on 2025/08/05.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - UI components of application
 ViewModel - Manages Models for View, where data is manages
 */

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
