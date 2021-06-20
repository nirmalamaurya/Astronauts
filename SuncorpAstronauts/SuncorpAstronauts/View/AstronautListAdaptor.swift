//
//  AstronautListAdaptor.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 16/6/21.
//

import Foundation
import UIKit

class AstronautListViewAdaptor :NSObject {
    private var astronauts: [Astronaut] = []
    private let cellIdentifier = "astronautCell"
    weak var delegate :AstronautListViewController!
    
    init(delegate : AstronautListViewController) {
        self.delegate = delegate
    }
    
    
    func updateRecord(with astronauts: [Astronaut]){
        self.astronauts+=astronauts
    }
}

extension AstronautListViewAdaptor : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return astronauts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let astronautCell : AstronautCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AstronautCell{
             astronautCell.configureCell(with: astronauts[indexPath.row])
             return astronautCell
         }
         return UITableViewCell()
     }
    }

 extension AstronautListViewAdaptor : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.performSegue(withIdentifier: "showDetail", sender: astronauts[indexPath.row].id)
    }
}

extension AstronautListViewAdaptor : ViewDisplayer{
    
    func updateView(with error: Error) {
        
        delegate.progressView.isHidden = true
        delegate.errorView.isHidden = false
        delegate.tableView.isHidden = true
        delegate.view.bringSubviewToFront(delegate.errorView)
    }
    
    func updateView(with data: Data) {
        
        guard let astronautData =  try? JSONDecoder().decode(ResponseData.self, from: data) else{
            return
    }
      self.updateRecord(with: astronautData.results)
        DispatchQueue.main.async {
            self.delegate.tableView.reloadData()
            self.delegate.tableView.isHidden = false
            self.delegate.progressView.isHidden = true
            self.delegate.view.bringSubviewToFront(self.delegate.tableView)
        }
    }
    
    func updateView(with dataState: ViewState) {
        self.delegate.tableView.isHidden = true
        self.delegate.progressView.isHidden = false
        self.delegate.view.bringSubviewToFront(self.delegate.progressView)
    }
    
}


    
