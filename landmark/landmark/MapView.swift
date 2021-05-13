//
//  MapView.swift
//  landmark
//
//  Created by bevan christian on 08/05/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    var coordinate:CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // on appear ini mirip dengan view did load karena dijalankan ketika on appear
        Map(coordinateRegion: $region).onAppear(perform: {
            setRegion(coordinate)
            // ketika dibukak maka langsung set region supaya map($region) terisi
        })
    }
    
    
    func setRegion(_ coordinate:CLLocationCoordinate2D)  {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
