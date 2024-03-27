//
//  swiftui_todoApp.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

@main
struct swiftui_todoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .tint(.primary)
        }
    }
}
