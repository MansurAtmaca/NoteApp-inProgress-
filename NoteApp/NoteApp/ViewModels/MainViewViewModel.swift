//
//  MainViewViewModel.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 3.05.2024.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUser: String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener{[weak self] _, user in
            
            DispatchQueue.main.async {
                self?.currentUser = user?.uid ?? ""
            }
        }
    }
    
    public var isSigned: Bool{
        return Auth.auth().currentUser != nil
    }
}
