//
//  Landmark.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark:Hashable,Codable,Identifiable {

    // kalo ada protocol indentifiable harus ada prop id
    var id:Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite:Bool
    // nerima nama image nya dari json jadi cuma nyimpen nama gambar
    var imageName:String
    // langsung diubah jadi image/gambar dnegan image jadi image ini nyimpen e foto
    var image:Image{
        Image(imageName)
    }
    var coordinates:Coordinates
    
    // ketika coordinates masuk maka langsung diubah jadi clcordinate
    var LocationCoordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
  
    


}

struct Coordinates:Hashable,Codable {
    var latitude: Double
    var longitude: Double
}

