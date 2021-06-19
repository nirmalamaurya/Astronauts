//
//  ViewDisplayer.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 19/6/21.
//

import Foundation


protocol ViewDisplayer {
    func  updateView(with error : Error)
    func  updateView(with result : [Astronaut])
    func updateView(with dataState: ViewState)
}
