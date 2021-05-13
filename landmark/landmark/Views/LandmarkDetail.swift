//
//  LandmarkDetail.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI

struct LandmarkDetail: View {
    // einvormenment karena akan mengawasi tiap perubahan kalo ada perubahan update yang oo
    // dan ini eo soale dipakek dibanyak view dan refernece
    @EnvironmentObject var modelData:ModelData
    var landmark:Landmark
    var landmarkIndex:Int{
        modelData.landmarks.firstIndex { a in
            a.id == landmark.id
        }!
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.LocationCoordinate).frame( height:300).ignoresSafeArea(edges:.top)
            CircleImage(image: landmark.image).offset(x: 0.0, y:-130).padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title).multilineTextAlignment(.leading).foregroundColor(.black)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    Button("ubah") {
                        modelData.nama = "halo"
                    }
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline).foregroundColor(.gray)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }.padding()
            Spacer()
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0]).environmentObject(ModelData())
    }
}
