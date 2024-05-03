//
//  RegisterView.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 2.05.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 200,height: 200)
        Form{
            Section(header: Text("Kayıt Formu"), content: {
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                TextField("Tam adınız", text: $viewModel.name)
                TextField("Email", text: $viewModel.email)
                TextField("Şifre", text: $viewModel.password)
            })
        }
        .frame(height: 250)
        BigButton(text: "Kayıt Ol", action: viewModel.login)
        Spacer()
    }
}

#Preview {
    RegisterView()
}
