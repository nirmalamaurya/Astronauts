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




    
