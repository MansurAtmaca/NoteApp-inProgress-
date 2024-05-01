//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 2.05.2024.
//

import SwiftUI
import FirebaseCore

@main
struct NoteAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
