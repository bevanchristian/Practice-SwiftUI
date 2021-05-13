//
//  ModelData.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import Foundation
import Combine

// oo itu dari combine dan dia pakek oo karena yang diawasi adalah landmarks
final class ModelData:ObservableObject{
    @Published var landmarks:[Landmark] = load("landmarkData.json")
    @Published var nama = "00"
    var hikes:[Hike] = load("hikeData.json")
    
    var categories: [String: [Landmark]] {
          Dictionary(
              grouping: landmarks,
              by: { $0.category.rawValue }
          )
        
    
 
      }
    var features:[Landmark]{
        landmarks.filter{ a in
            a.isFeatured
        }
    }
}


// alasan tidak dimasukan class ato struct supaya bisa dipanggil darimana saja


func load<T:Decodable>(_ fileName:String)->T{
    let data:Data
    //diambil dulu dari bundle
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError()
    }
    
   
    
    // diubah jadi data dulu
    do {
       data = try Data(contentsOf: file)
    } catch  {
        fatalError()
    }
    
    // baru di decode dan kalo berhasil di return
    
    do {
        let decoder = JSONDecoder()
        // kenapa T.self kok ga landmark soale T.self itu auto menuju ke model tiap json masing"
        return try decoder.decode(T.self, from: data)
    } catch  {
        fatalError()
    }
    
}
