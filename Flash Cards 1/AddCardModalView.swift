//
//  AddCardModalView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/8/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct AddCardModalView: View {
    // 1.
    @Binding var showModal: Bool
    @State var question: String
    @State var answer: String
    @Binding var box: Box
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                TextField("Type your question here:", text: $question)
                    .fixedSize()
                    
                
                Spacer()
                TextField("Type your answer here:", text: $answer)
                    .fixedSize()
                Spacer()
                Button(action:{self.box.cards.append(Card(id: UUID(), question: self.question, answer: self.answer))
                    self.showModal.toggle()
                }){
                    Text("Submit")
                        .font(.headline)
                    .padding()
                    
                }
                Button(action: {
                    self.showModal.toggle()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .fontWeight(.heavy)
                    }
                
                
                Spacer()
            }
            .navigationBarTitle("New Flashcard")
        }
    }
}

struct AddCardModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardModalView(showModal: .constant(true), question: "", answer: "", box: .constant(Box(id: UUID(), title: "", cards: [])))
    }
}
