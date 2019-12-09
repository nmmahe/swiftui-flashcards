//
//  CardsetView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/8/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct CardsetView: View {
    @State private var showModal = false
    @State var box: Box
    var body: some View {
        VStack{
           Text(box.title)
            List{
                ForEach (box.cards){ card in
                    /*NavigationLink(destination: Text(card.answer)){
                        Text(card.question)
                    }*/
                    CardView(card:card)
                    
                }
            }
        }.navigationBarTitle(Text(box.title))
        .navigationBarItems(
            trailing: Button(action: {self.showModal.toggle()}, label: { Text("Add") }
            ).sheet(isPresented: self.$showModal){
                AddCardModalView(showModal: self.$showModal, question: "", answer: "", box: self.$box)
            }
        )
        //Put in a card from the stack here
        //Also add in an actionsheet to add a new card to the stack
        //Take actionsheet info and append it as a new card to self.box
    }
}

struct CardsetView_Previews: PreviewProvider {
    static var previews: some View {
        CardsetView(box:Box(id:UUID(), title:"test", cards:[]))
    }
}
