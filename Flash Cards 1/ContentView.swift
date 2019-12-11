//
//  ContentView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/3/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var num = 1
    @State private var showModal = false
    @State var boxes: [Box] = [
        Box(id: UUID(), title: "Music", cards: [Card(id: UUID(), question: "What is my age?", answer: "24"), Card(id: UUID(), question: "Where am I from?", answer: "San Francisco, California")]),
        Box(id:UUID(), title: "History", cards: []),
        Box(id:UUID(), title: "Math", cards: []),
        Box(id:UUID(), title: "Science", cards: []),
        Box(id:UUID(), title: "Nutrition", cards: [])
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        //(boxes, \.self.id
                            ForEach(boxes) { box in
                                NavigationLink(destination:
                                    CardsetView(boxes: self.$boxes, box: box))
                                {
                                    BoxView(box: box)
                            }
                        }
                    }
                    
                    //Text(String(num))
                    //todo: take this out
                }
                .padding(.top, 50)
                Spacer()
                //Any additional contact in here for front page
                
            }
            .navigationBarTitle(Text("Flashcard Topics"))
            .navigationBarItems(
                trailing: Button(action: {self.showModal.toggle()}, label: {            Text("Add") })
                     .sheet(isPresented: self.$showModal){
                        AddTopicModalView(showModal: self.$showModal, boxes: self.$boxes, topic: "")
                }
            )
        }
    .background(Color(.black))
    //todo: make this work
    }

}

    struct BoxView: View{
    let box: Box
    
    private func getColor() -> Color{
        let rTarget = Double.random(in: 0..<1)
        let gTarget = Double.random(in: 0..<1)
        let bTarget = Double.random(in: 0..<1)
                
        return Color(red: rTarget, green: gTarget, blue: bTarget)
    }
    
    var body: some View{
        VStack{
            Rectangle()
                .fill(getColor())
                .frame(width:120, height:120)
            .cornerRadius(12)
            
            Text(self.box.title)
                .font(.headline)
                
            
        }
    }
}

struct Box: Identifiable, Hashable{

    var id = UUID()
    var title: String
    var cards: [Card]
    /*init(id:UUID, title:String, cards:[Card]){
        self.id = UUID()
        self.title = title
        self.cards = cards
    }*/
}


struct Card: Identifiable, Hashable{
    var id = UUID()
    var question: String
    var answer: String
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
