//
//  ScaleImageView.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import SwiftUI

struct ScaleImageView: View {
    let name:String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
//struct ScaleImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScaleImageView()
//    }
//}
