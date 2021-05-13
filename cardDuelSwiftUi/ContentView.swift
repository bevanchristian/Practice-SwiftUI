//
//  ContentView.swift
//  cardDuelSwiftUi
//
//  Created by bevan christian on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var num1 = 2
    @State private var num2 = 3
    
    @State private var score1 = 10
    @State private var score2 = 10
    var body: some View {
        ZStack {
            Image("Background")
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Image("card"+String(num1))
                    Image("card"+String(num2))
                }.padding()
                Spacer()
                Button(action: {
                    
                    num1 = Int.random(in: 2...14)
                    num2 = Int.random(in: 2...14)
                    
                    if num1>num2{
                        score1 += 10
                        score2 -= 5
                    }else{
                        score2 += 10
                        score1 -= 5
                    }
                    
                    if num1 < 0 || num2 < 0{
                        Alert(title: Text("kalah"), message:Text("kalah") , dismissButton:.default(Text("Got it!")))
                    }
                }, label: {
                   Image("dealbutton")
                })
                Spacer()
                
                HStack{
                    VStack{
                        Text("Cpu 1").foregroundColor(.white).multilineTextAlignment(.center)
                        Text(String(score1)+"pt").foregroundColor(.white).multilineTextAlignment(.leading)
                    }
                    Spacer()
                    VStack{
                        Text("Cpu 2").foregroundColor(.white).multilineTextAlignment(.center)
                        Text(String(score2)+"pt").foregroundColor(.white).multilineTextAlignment(.leading)
                    }
                    
                }.padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
