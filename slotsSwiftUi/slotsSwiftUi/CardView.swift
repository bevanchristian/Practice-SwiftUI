//
//  CardView.swift
//  slotsSwiftUi
//
//  Created by bevan christian on 12/05/21.
//

import SwiftUI

struct CardView: View {
    @Binding var image:String
    @Binding var back:Color
    var body: some View {
        
        VStack{
            if image == "apple"{
                Image(image).transition(AnyTransition.move(edge: .bottom)).animation(.default)
            
            }else if image == "donut"{
                Image(image).transition(AnyTransition.move(edge: .bottom)).animation(.default)
            
            }else{
                Image(image).transition(AnyTransition.move(edge: .bottom)).animation(.default)
            
            }
        }.padding().background(back.opacity(0.5)).cornerRadius(15)
      
       
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: Binding.constant("apple"), back: Binding.constant(Color.white))
    }
}
