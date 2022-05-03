//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel:FirstTabViewModel
    
    var body: some View {
        
        VStack {
            Text("First Detail")
            
            TextField("name",text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("email",text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: FirstTabViewModel())
    }
}
