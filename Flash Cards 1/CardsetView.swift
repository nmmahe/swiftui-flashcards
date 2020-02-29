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
    //Need to have the boxes array here so it can bind to parent
    @Binding var boxes: [Box]
    @State var box: Box
    
    var body: some View {
        VStack{
            Text(box.cards != [] ? "" : "No cards made yet!")
            List{
                ForEach (box.cards){ card in
                    
                    CardView(card: card)
                }
            }
        }.navigationBarTitle(Text(box.title))
        .navigationBarItems(
            trailing: Button(action: {self.showModal.toggle()}, label: { Image(systemName: "plus.circle")
                .font(.largeTitle) })
                //BUG: The modal sheet only seems to work once. When you try a second time, it won't work unless you go to another view first and return
                .sheet(isPresented: self.$showModal){
                AddCardModalView(showModal: self.$showModal, question: "", answer: "", box: self.$box)
            }
        )
            .onDisappear(perform: {self.updateUI()})
}
    
    //update the Collection of boxes with the new card
    func updateUI(){
        
        self.boxes = boxes.map{ (ibox: Box) -> Box in
        let mutableIbox = ibox
        return mutableIbox.id == self.box.id ? self.box : mutableIbox
        }
        
        
        
    }
}

/*struct CardsetView_Previews: PreviewProvider {
    static var previews: some View {
        CardsetView(boxes: .constant(<#T##value: [Box]##[Box]#>), box:.constant(Box(id: UUID(), title: "test", cards: [])))
    }
 }*/
