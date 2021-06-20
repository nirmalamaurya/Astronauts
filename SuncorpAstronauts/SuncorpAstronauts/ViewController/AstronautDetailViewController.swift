//
//  AstronautDetailViewController.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 19/6/21.
//

import UIKit
import SDWebImage

class AstronautDetailViewController: UIViewController {
    
    @IBOutlet var astronautImageView : UIImageView!
    @IBOutlet var astronautName : UILabel!
    @IBOutlet var astronautNationality : UILabel!
    @IBOutlet var astronautBio: UILabel!
    @IBOutlet var astronautDOB : UILabel!
    var progressView : ProgressView!
    var errorView : ErrorView!
    private var astronautViewModel : AstronautViewModel!
    private var displayer : ViewDisplayer!
    private var astronautListAdaptor : AstronautDetailViewAdaptor! = nil
    var astronautId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpProgressView()
        setUpErrorView()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        astronautListAdaptor = AstronautDetailViewAdaptor(delegate: self)
        astronautViewModel = AstronautViewModel(displayer: astronautListAdaptor, requestHandler: ServiceManager(urlType: .detail, endPoint: String(astronautId!)))
        astronautViewModel.fetchData()
    }
    
}

extension AstronautDetailViewController{
    func setUpProgressView() {
        progressView = ProgressView(frame: self.view.frame)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressView)
        progressView.isHidden = true
        setUpProgressViewConstraints()
    }
    func setUpProgressViewConstraints() {
        let leadingConstraint = progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = progressView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        self.view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
    func setUpErrorView() {
        errorView = ErrorView(frame: self.view.frame)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(errorView)
        errorView.isHidden = true
        setUpConstraints()
    }
    func setUpConstraints() {
        let leadingConstraint = errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let upConstraint = errorView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomConstraint = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        view.addConstraints([leadingConstraint, trailingConstraint, upConstraint, bottomConstraint])
    }
    
    
}



