//
//  ContentView.swift
//  slotsSwiftUi
//
//  Created by bevan christian on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var image = ["apple","donut","lemon"]
    @State var background = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
    @State private var ind = [0,0,0,1,0,0,0,0,0]
    @State private var credit = 1000
    @State private var isWin = false
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.orange).ignoresSafeArea()
            
            Rectangle().foregroundColor(Color(red: 228/225, green: 143/225, blue: 76/225, opacity: 1)).rotationEffect(.degrees(45)).ignoresSafeArea()
            
            
            VStack {
                Spacer()
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("Swift ui slots")
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(2).padding()
                Spacer()
                Text("Credits:\(credit)")
                    .padding()
                    .background(isWin ? Color.gray.opacity(0.5):Color.white.opacity(0.5))
                    .cornerRadius(20)
                    .animation(.none)
                    .scaleEffect(isWin ? 1.2 : 1)
                    .animation(.spring(response: 0.34, dampingFraction: 0.2))
                
                Spacer()
                HStack{
                  
                    CardView(image: $image[ind[0]], back: $background[0])
                    CardView(image: $image[ind[1]], back:  $background[1])
                    CardView(image: $image[ind[2]], back:  $background[2])
                   
                }
                HStack{
                  
                    CardView(image: $image[ind[3]], back: $background[3])
                    CardView(image: $image[ind[4]], back:  $background[4])
                    CardView(image: $image[ind[5]], back:  $background[5])
                   
                }
                HStack{
                  
                    CardView(image: $image[ind[6]], back: $background[6])
                    CardView(image: $image[ind[7]], back:  $background[7])
                    CardView(image: $image[ind[8]], back:  $background[8])
                   
                }
                Spacer()
                Button(action: {
                   // background pasti putih
                    background = background.map { (a) in
                        Color.white
                    }
                    
                    // acak random
                    ind = ind.map { (a) in
                        Int.random(in: 0...2)
                    }
                    isWin = false
                    if ismatch(num1: 0, num2: 1, num3: 2) {
                        credit += 10
                        isWin = true
                    }else if ismatch(num1: 3, num2: 4, num3: 5) {
                        credit += 10
                        isWin = true
                    }
                    else if ismatch(num1: 6, num2: 7, num3: 8) {
                        credit += 10
                        isWin = true
                    }
                    else if ismatch(num1: 0, num2: 4, num3: 8) {
                        credit += 10
                        isWin = true
                    }
                    else if ismatch(num1: 2, num2: 4, num3: 6) {
                        credit += 10
                        isWin = true
                    }else{
                        credit -= 5
                    }
                    
                }, label: {
                    Text("Spinn").padding().background(Color.red).cornerRadius(10).foregroundColor(.white)
                })
           
            }.animation(.default)
            
        }
    }
    func ismatch(num1:Int,num2:Int,num3:Int) -> Bool {
        if ind[num1] == ind[num2] && ind[num2] == ind[num3]{
            // kalo sama smeua +10 dan ubah back jadi hijau
            background[num1] = Color.green
            background[num2] = Color.green
            background[num3] = Color.green
            return true
        }
     
        return false
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
