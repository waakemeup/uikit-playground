//
//  FirstTabViewModel.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import Foundation


class FirstTabViewModel:ObservableObject {
    @Published var name:String = ""
    @Published var email:String = ""
}
