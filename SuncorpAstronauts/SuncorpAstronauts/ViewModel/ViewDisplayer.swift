//
//  ViewDisplayer.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 19/6/21.
//

import Foundation

enum ViewState{
    case preseting
}

protocol ViewDisplayer {
    func  updateView(with error : Error)
    func  updateView(with data : Data)
    func updateView(with dataState: ViewState)
}
