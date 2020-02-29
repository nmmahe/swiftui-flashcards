//
//  CardView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/8/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct CardView: View {
    // state variable used to update the card
    @State var flipped = false
    let card: Card
    var body: some View {
        
        Text(self.flipped ? card.answer : card.question)
            .foregroundColor(self.flipped ? .red : .blue) // change the card color when flipped
            .padding()
            .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default) // implicitly applying animation
            .onTapGesture {
                self.flipped.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:Card(id: UUID(), question: "What?", answer: "Answer"))
    }
}
