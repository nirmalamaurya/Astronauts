//
//  AstronautDetailAdaptor.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 20/6/21.
//

import Foundation
import SDWebImage
class AstronautDetailViewAdaptor :NSObject {
    
    
    weak var delegate :AstronautDetailViewController!
    
    init(delegate : AstronautDetailViewController) {
        self.delegate = delegate
    }
}

extension AstronautDetailViewAdaptor : ViewDisplayer {
    
    func updateView(with error: Error) {

        self.delegate.progressView.isHidden = true
        self.delegate.errorView.isHidden = false
        self.delegate.view.bringSubviewToFront(self.delegate.errorView)

    }

    func updateView(with data: Data) {

        delegate.progressView.isHidden = true
        
        guard let astronaut =  try? JSONDecoder().decode(Astronaut.self, from: data) else{
            return
    }
        delegate.astronautName.text =  astronaut.name
        delegate.astronautNationality.text = astronaut.nationality
        delegate.astronautDOB.text = astronaut.bio
        delegate.astronautBio.text = astronaut.date_of_birth
        if let url = astronaut.makeImageUrl(){
        let image = UIImage(named: "placeholder")
            delegate.astronautImageView.sd_setImage(with: url, placeholderImage: image)
        }

    }

    func updateView(with dataState: ViewState) {

        delegate.progressView.isHidden = false
        self.delegate.view.bringSubviewToFront(delegate.progressView)
    }
}
