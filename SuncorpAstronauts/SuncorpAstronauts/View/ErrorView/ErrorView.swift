//
//  ErrorView.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 20/6/21.
//

import Foundation
import UIKit

class ErrorView: UIView {

    let errorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setUpErrorLabel()
    }
    
    func setUpErrorLabel() {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "Error!!!! \nPlease try after some time."
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.addSubview(errorLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let horizontalConstraint = errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = errorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let leadingConstraint = errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        self.addConstraints([horizontalConstraint, verticalConstraint, leadingConstraint])
    }
}
