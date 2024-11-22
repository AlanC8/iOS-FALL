//
//  SuperHeroView.swift
//  task10
//
//  Created by Алан Абзалханулы on 22.11.2024.
//

import UIKit

class SuperHeroView {
    var nameLabel = UILabel()
    var fullNameLabel = UILabel()
    var alterEgosLabel = UILabel()
    var placeOfBirthLabel = UILabel()
    var firstAppearanceLabel = UILabel()
    var publisherLabel = UILabel()
    var intelligenceLabel = UILabel()
    var powerLabel = UILabel()
    var speedLabel = UILabel()
    var durabilityLabel = UILabel()
    var combatLabel = UILabel()
    var imageView = UIImageView()
    var randomizeButton = UIButton(type: .system)
    
    init(view: UIView, parent: UIViewController) {
        setupImageView(view: view)
        setupLabels(view: view)
        setupRandomizeButton(view: view, parent: parent)
    }
    
    private func setupImageView(view: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupLabels(view: UIView) {
        let labels = [nameLabel, fullNameLabel, alterEgosLabel, placeOfBirthLabel, firstAppearanceLabel, publisherLabel, intelligenceLabel, powerLabel, speedLabel, durabilityLabel, combatLabel]
        var previousLabel: UILabel?
        
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            label.numberOfLines = 0
            label.textColor = UIColor.darkGray
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                label.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? imageView.bottomAnchor, constant: 10)
            ])
            
            previousLabel = label
        }
    }
    
    private func setupRandomizeButton(view: UIView, parent: UIViewController) {
        randomizeButton.translatesAutoresizingMaskIntoConstraints = false
        randomizeButton.setTitle("Randomize", for: .normal)
        randomizeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        randomizeButton.backgroundColor = UIColor.systemBlue
        randomizeButton.setTitleColor(.white, for: .normal)
        randomizeButton.layer.cornerRadius = 10
        
        view.addSubview(randomizeButton)
        
        NSLayoutConstraint.activate([
            randomizeButton.topAnchor.constraint(equalTo: combatLabel.bottomAnchor, constant: 20),
            randomizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomizeButton.widthAnchor.constraint(equalToConstant: 200),
            randomizeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        randomizeButton.addTarget(parent, action: #selector(ViewController.randomizeAction), for: .touchUpInside)
    }
}
