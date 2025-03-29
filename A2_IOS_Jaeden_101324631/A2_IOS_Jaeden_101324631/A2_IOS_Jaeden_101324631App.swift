//  A2_IOS_Jaeden_101324631App.swift
//  A2_IOS_Jaeden_101324631
import SwiftUI

@main
struct A2_IOS_Jaeden_101324631App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
