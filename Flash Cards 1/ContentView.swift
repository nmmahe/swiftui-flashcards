//
//  ContentView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/3/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @State var boxes: [Box] = [
        Box(id: UUID(), title: "Music", cards: [Card(id: UUID(), question: "Who is the founder of American music?", answer: "Charles Ives"), Card(id: UUID(), question: "Who is known for creating the prepared piano?", answer: "John Cage")]),
        Box(id:UUID(), title: "History", cards: []),
        Box(id:UUID(), title: "Math", cards: []),
        Box(id:UUID(), title: "Science", cards: []),
        Box(id:UUID(), title: "Nutrition", cards: [])
    ]
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
            
        //BUG: NavigationViews currently won't work when rotating to landscape. This is a current bug. If you change the component to a List, it will work. For the project, I'll need the navigation
            NavigationView{
                        VStack{
                            ScrollView(.horizontal){
                                HStack{
                                    
                                        ForEach(boxes) { box in
                                            NavigationLink(destination:
                                                CardsetView(boxes: self.$boxes, box: box))
                                            {
                                                BoxView(box: box)
                                        }
                                    }
                                }
                            }
                            .padding(.top, 50)
                            Spacer()
                            Text("\(currentDate)")
                            .onReceive(timer) { input in
                                self.currentDate = input
                            }
                            .font(.title)
                        .multilineTextAlignment(.center)
                        
                            .padding()
                            .border(/*@START_MENU_TOKEN@*/Color.purple/*@END_MENU_TOKEN@*/, width: 5)
                            Spacer()
                        }
                        .navigationBarTitle(Text("Flashcard Topics"))
                        .navigationBarItems(
                            trailing: Button(action: {self.showModal.toggle()}, label: {            Image(systemName: "plus.circle")
                                .font(.largeTitle)
      
                            })
                                //BUG: The modal sheet only seems to work once. When you try a second time, it won't work unless you go to another view first and return
                                 .sheet(isPresented: self.$showModal){
                                    AddTopicModalView(showModal: self.$showModal, boxes: self.$boxes, topic: "")
                            }
                            
                        )
                    }
            .environment(\.colorScheme, .dark)
            //Dark mode theme
                

            }
struct BoxView: View{
    let box: Box
    //Make each box a random color
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
                .fontWeight(.heavy)
        }
    }
}
        
}

struct Box: Identifiable, Hashable{
    var id = UUID()
    var title: String
    var cards: [Card]
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
