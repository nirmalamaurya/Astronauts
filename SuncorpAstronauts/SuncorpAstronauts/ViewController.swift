//
//  ViewController.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceManager.sharedInstance.getAstronaunts {
            
        }
        // Do any additional setup after loading the view.
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let astronautCell : AstronautCell = tableView.dequeueReusableCell(withIdentifier: "astronautCell", for: indexPath) as? AstronautCell{
                 return astronautCell
        }
        return UITableViewCell()
    }
    
    
}
extension ViewController : UITableViewDelegate{
    
}

