//
//  LandmarkList.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI

struct LandmarkList: View {
    // kenapa einvorement object soale bakalan dipakek di multiple view
    // dan ini eo soale dipakek dibanyak view dan refernece
    @EnvironmentObject var modelData:ModelData
    @State private var showFavouriteOnly = false
    
    
    // ini datanya aku filter dimana jika showfavoriteonly = false maka !false=true sehingga semua pasti muncul namun jila showfavoriteonly = true maka !true=false sehingga kalo or semuae false maka tidak akan dimasukan sehingga yang masuk cuma yang favourite
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavouriteOnly || landmark.isFavorite)
        }
        
    }
    var body: some View {
        
      // navvigation view ini mirip dengan navcontroler
        NavigationView{
            // list itu perlu indentitas caranya bisa 2 dengan conform protocol identifiable di model atau passing ,id: \.property yang mau dijadikan id. yg skrng pkek conform protocol mirip dengan tableview
            List{
                //$show itu binding jadi toogle otomatis ganti true false ketika dipencet
                Text(modelData.nama)
                Toggle(isOn: $showFavouriteOnly) {
                    Text("Favorites only")+Text("asu").foregroundColor(.gray)
                }
                // list pakek foreach soale ada static view yang digabung
                ForEach(filteredLandmarks) { landmark in
                //setiap baris bisa pindah ke halaman lain dimana destination adlaah halaman tujuan dengan membawa landmark yang dipencet
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    // ini row nya
                    LandmarkRow(landmark: landmark)
                    // list itu mirip tableview dimana ini menduplikat view berurang kali
                }
            }
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {

        // kalo ada for di swift ui wajib ada id ne
        LandmarkList().environmentObject(ModelData())
     
    }
}
