//
//  LoginView.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 2.05.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoignViewViewModel()
    var body: some View {
    
        NavigationStack{
            Image("logo")
                .resizable()
                .frame(width: 200,height: 200)
            Form{
                if !viewmodel.errorMessage.isEmpty{
                    Text(viewmodel.errorMessage)
                        .foregroundStyle(.red)
                }
                TextField("E-posta", text: $viewmodel.email)
                SecureField("Şifre", text: $viewmodel.password)
            }
            .frame(height: 200)
            BigButton(text: "Giriş Yap", action: viewmodel.login)
            HStack{
                Text("İlk kez mi geliyorsun!")
                
                NavigationLink(destination: RegisterView(), label: {
                    Text("Kayıt ol")
                })
            }
        }
      
        Spacer()
        
      
    }
}

#Preview {
  LoginView()
}
