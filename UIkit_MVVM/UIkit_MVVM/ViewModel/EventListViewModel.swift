//
//  EventListViewModel.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/5.
//

import Foundation

final class EventListViewModel {
  let title = "Events"
  var coordinator:EventListCoordinator?
  func tappedAddEvent(){
    coordinator?.startAddEvent()
  }
}
