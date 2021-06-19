//
//  AstronautListAdaptor.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 16/6/21.
//

import Foundation
import UIKit


class AstronautListViewAdaptor :NSObject {
    
}

extension AstronautListViewAdaptor : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
   
}
    
