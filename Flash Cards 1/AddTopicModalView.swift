//
//  AddTopicModalView.swift
//  Flash Cards 1
//
//  Created by Nick Mahe on 12/9/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import SwiftUI

struct AddTopicModalView: View {
    
    @Binding var showModal: Bool
    @Binding var boxes: [Box]
    @State var topic: String
   
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                TextField("What's the new topic?", text: self.$topic)
                    .fixedSize()
                    .font(.headline)
                Spacer()
                Button(action:{self.boxes.append(Box(id: UUID(), title: self.topic, cards: []))
                    
                    self.showModal.toggle()
                }){
                    Text("Submit")
                        .font(.headline)
                    .padding()
                    
                }
                Button(action: {
                    self.showModal.toggle()
                })
                {
                    Text("Cancel")
                        .font(.headline)
                        .fontWeight(.heavy)
                    }
                Spacer()
            }
            .navigationBarTitle("New Topic")
        }
        .environment(\.colorScheme, .dark)
    }
}

/*struct AddTopicModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddTopicModalView(showModal: .constant(false), boxes: .constant(<#T##value: [Box]##[Box]#>), topic: "")
    }
}*/
