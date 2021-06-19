//
//  ViewController.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet var tableView : UITableView!
    private var astronauListViewModel:AstronautListViewModel!
    private var progressView : ProgressView!
    private var astronauts: [Astronaut] = []
    private let cellIdentifier = "astronautCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressView()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        
        astronauListViewModel = AstronautListViewModel(displayer: self, requestHandler: ServiceManager(urlType: .list))
        astronauListViewModel?.fetchData()
    }
    
    func setupProgressView() {
        progressView = ProgressView(frame: self.view.frame)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressView)
        progressView.isHidden = true
        setupProgressViewConstraints()
    }
    func setupProgressViewConstraints() {
        let leadingConstraint = progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = progressView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        self.view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
    
}
extension ViewController : UITableViewDataSource{
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
extension ViewController : UITableViewDelegate{
    
}

extension ViewController : ViewDisplayer{
    
    func updateView(with error: Error) {
        
        print("updateView With Error")
    }
    
    func updateView(with astronauts: [Astronaut]) {
        self.astronauts+=astronauts
        tableView.reloadData()
        tableView.isHidden = false
        progressView.isHidden = true
        self.view.bringSubviewToFront(tableView)
    }
    
    func updateView(with dataState: ViewState) {
        tableView.isHidden = true
        progressView.isHidden = false
        self.view.bringSubviewToFront(progressView)
    }
    
}

