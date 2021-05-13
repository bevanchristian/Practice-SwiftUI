//
//  LandmarkRow.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI

struct LandmarkRow: View {
    // setiap ada var di dalam struct maka wajib diisi di params
    var landmark :Landmark
    var body: some View {
        HStack {
            // landmark yang didaapat image jadi ketika view tampilan ini dipanggil maka dia sudah dapat .image nya dan diksih frame 50,50 supaya table view nya ga besar"
            landmark.image.resizable().frame(width: 50, height: 50)
            // untuk tableview wajib ada frame soale ini yang ngatur besar kecil e table e
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite{
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}


// hanya tampilan saja
struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        
        // fungsi dari grup adalah sebagai container ini cuma tampilan saja
        Group{
            // contohnya seperti ini
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[4])
        }.previewLayout(.fixed(width: 300, height: 50))
        
    }
}
