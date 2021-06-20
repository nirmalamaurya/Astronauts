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
    private var progressView : ProgressView!
    private var errorView : ErrorView!

    private var astronautViewModel : AstronautViewModel!
    private var displayer : ViewDisplayer!
    var astronautId : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupProgressView()
        setupErrorView()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        
        astronautViewModel = AstronautViewModel(displayer: self, requestHandler: ServiceManager(urlType: .detail, endPoint: String(astronautId!)))
        astronautViewModel.fetchData()
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AstronautDetailViewController : ViewDisplayer{

    func updateView(with error: Error) {

        self.progressView.isHidden = true
        self.errorView.isHidden = false
        self.view.bringSubviewToFront(self.errorView)

    }

    func updateView(with data: Data) {

        progressView.isHidden = true
        
        guard let astronaut =  try? JSONDecoder().decode(Astronaut.self, from: data) else{
            return
    }
        astronautName.text =  astronaut.name
        astronautNationality.text = astronaut.nationality
        astronautDOB.text = astronaut.bio
        astronautBio.text = astronaut.date_of_birth
        if let url = astronaut.makeImageUrl(){
        let image = UIImage(named: "placeholder")
        astronautImageView.sd_setImage(with: url, placeholderImage: image)
        }

    }

    func updateView(with dataState: ViewState) {

        progressView.isHidden = false
        self.view.bringSubviewToFront(progressView)
    }
}
