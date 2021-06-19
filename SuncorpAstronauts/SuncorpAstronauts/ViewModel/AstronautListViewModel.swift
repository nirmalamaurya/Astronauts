//
//  AstronautListViewModel.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 16/6/21.
//

import Foundation


protocol ListReceivable {
    func fetchData()
}


enum ViewState{
    
    case preseting
}

class AstronautListViewModel : ListReceivable{
    
    let requestHandler : RequestHandler
    let displayer: ViewDisplayer?
    let state: ViewState
    
    init(displayer : ViewDisplayer,requestHandler : RequestHandler, state: ViewState = .preseting){
        self.displayer = displayer
        self.requestHandler = requestHandler
        self.state = state
    }
    
    
    func fetchData() {
        displayer?.updateView(with: state)
        
        DispatchQueue.global().async {
            self.requestHandler.getAstronauts { astronaut in
                DispatchQueue.main.async {
                    
                    self.displayer?.updateView(with: astronaut)
                }
            } errorHandler: { error in
                DispatchQueue.main.async {
                    self.displayer?.updateView(with: error)
                    
                }
            }
        }
    }
}
