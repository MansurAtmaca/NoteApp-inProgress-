//
//  LoignViewViewModel.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 3.05.2024.
//

import Foundation

class LoignViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init (){}
    
    func login(){
        guard validate()else{
            return
        }
    }
    
    func validate()->Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Lütfen tüm alanları doldurunuz!"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Lütfen geçerli bir mail girtiniz!"
            return false
        }
        return true
    }
}
