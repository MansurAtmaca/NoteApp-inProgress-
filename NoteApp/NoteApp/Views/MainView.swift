//
//  MainView.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 2.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewmodel = MainViewViewModel()
    var body: some View {
        if viewmodel.isSigned, !viewmodel.currentUser.isEmpty{
            ToDoListView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
