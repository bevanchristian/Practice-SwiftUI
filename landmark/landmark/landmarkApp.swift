//
//  landmarkApp.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI

@main
struct landmarkApp: App {
    // ini dilakukan karena stateobjek hanya dipakek di view ini dan reference type/class
    //state cuma bisa value type
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            // jadi main itu nunjuin entry app e
            ContentView().environmentObject(modelData)
        }
    }
}
