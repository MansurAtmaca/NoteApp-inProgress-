//
//  BigButton.swift
//  NoteApp
//
//  Created by Mansurcan ATMACA on 3.05.2024.
//

import SwiftUI

struct BigButton : View{
    let text:String
    let action:()->Void
    var body: some View {
        Button(action: action, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(.systemTeal))
                Text(text)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundStyle(Color(.white))
            }
        })
        .frame(height: 50)
        .padding(.horizontal,10)
    }
}
    
    
    #Preview {
        BigButton(text: "Text", action:{})
    }

