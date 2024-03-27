//
//  swiftui_todoApp.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

@main
struct swiftui_todoApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .tint(.primary)
        }
    }
}
