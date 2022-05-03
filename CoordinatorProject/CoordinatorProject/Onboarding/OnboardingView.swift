//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import SwiftUI

struct OnboardingView: View {
    var doneRequested: () -> (
        
    )
    
    var body: some View {
        TabView {
            ScaleImageView(name:"Ruby1")
                .tag(0)
            ScaleImageView(name:"Ruby2")
                .tag(1)
            ScaleImageView(name:"Ruby3")
                .tag(2)
            
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(.page)
        .background(Color.black)
        .ignoresSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneRequested: {})
    }
}


