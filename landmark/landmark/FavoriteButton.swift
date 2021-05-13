//
//  FavoriteButton.swift
//  landmark
//
//  Created by bevan christian on 09/05/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet:Bool
    var body: some View {
        Button(action: {
            // toogle itu false ke true , true ke false
            isSet.toggle()

        }) {
            // jika true maka starfill jika false maka star e ga fill dan warnae juga yellow kalo true dan gray kalo false
            Image(systemName: isSet ? "star.fill":"star").foregroundColor(isSet ? Color.yellow: Color.gray)
    }
       
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
