//
//  RegisterViewViewModel.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 3.05.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation


class RegisterViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    
    func login(){
        guard check()else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result,error in
             
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joines: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func check()->Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Tüm alanları doldurun"
            return false
        }
        
        guard password.count > 6 else{
            errorMessage = "Şifre çok kısa"
            return false
        }
        
        guard email.contains("@") &&  email.contains(".") else{
            errorMessage = "Geçerli bir mail giriniz"
            return false
        }
        return true
    }
  
}


