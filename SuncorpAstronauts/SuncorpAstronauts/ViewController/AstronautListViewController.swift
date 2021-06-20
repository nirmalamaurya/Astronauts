//
//  ViewController.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import UIKit


class AstronautListViewController: UIViewController{
    
    
    @IBOutlet var tableView : UITableView!
    var progressView : ProgressView!
    var errorView : ErrorView!
    private var astronautViewModel:AstronautViewModel!
    private var astronautListAdaptor : AstronautListViewAdaptor! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupErrorView()
        setupProgressView()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        
        self.astronautListAdaptor = AstronautListViewAdaptor(delegate: self)
        tableView.dataSource = self.astronautListAdaptor
        tableView.delegate = self.astronautListAdaptor
        astronautViewModel = AstronautViewModel(displayer:  self.astronautListAdaptor, requestHandler:  ServiceManager(urlType: .list, endPoint: ""))
        astronautViewModel.fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segue = segue.destination as? AstronautDetailViewController{
            if let id = sender as? Int{
                segue.astronautId = id
            }
        }
    }
}

extension AstronautListViewController{
    
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
    
    func setupErrorView() {
        errorView = ErrorView(frame: self.view.frame)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(errorView)
        errorView.isHidden = true
        setupConstraints()
    }
    func setupConstraints() {
        let leadingConstraint = errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = errorView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
    
}
