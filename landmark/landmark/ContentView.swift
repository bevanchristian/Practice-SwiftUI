//
//  ContentView.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI


// di dalam body tempat kamu buat desaine
struct ContentView: View {
  

    var body: some View {
        
        TabView {
            //halaman pertama
            LandmarkList().tabItem { Label("List", systemImage: "list.bullet") }
            CategoryHome().tabItem { Label("featured", systemImage: "star") }
    }
      
    }
}


// ini cuma buat preview yang bawah aja semisal view ini dipanggil di view lain maka tampilane view ini gini gitu lo
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
