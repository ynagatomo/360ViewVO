//
//  360ViewerVOApp.swift
//  360ViewerVO
//
//  Created by Yasuhito Nagatomo on 2023/09/22.
//

import SwiftUI

@main
struct _360ViewerVOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
