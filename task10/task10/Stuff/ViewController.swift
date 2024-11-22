//
//  ViewController.swift
//  task10
//
//  Created by Алан Абзалханулы on 21.11.2024.
//

import UIKit

class ViewController: UIViewController {
    var heroView: SuperHeroView!
    let superHeroAPI = SuperHeroAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        
        heroView = SuperHeroView(view: view, parent: self)
        fetchSuperHeroData(id: Int.random(in: 1...700))
    }
    
    func fetchSuperHeroData(id: Int) {
        let url = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        superHeroAPI.fetchData(from: url) { [weak self] result, error in
            if let error = error {
                print("Ошибка при загрузке данных: \(error)")
                return
            }
            
            if let hero = result {
                DispatchQueue.main.async {
                    self?.updateUI(with: hero)
                }
            }
        }
    }
    
    func updateUI(with hero: SuperHero) {
        heroView.nameLabel.text = "Name: \(hero.name)"
        heroView.fullNameLabel.text = "Full Name: \(hero.biography.fullName)"
        heroView.alterEgosLabel.text = "Alter Egos: \(hero.biography.alterEgos)"
        heroView.placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth)"
        heroView.firstAppearanceLabel.text = "First Appearance: \(hero.biography.firstAppearance)"
        heroView.publisherLabel.text = "Publisher: \(hero.biography.publisher)"
        heroView.intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        heroView.powerLabel.text = "Power: \(hero.powerstats.power)"
        heroView.speedLabel.text = "Speed: \(hero.powerstats.speed)"
        heroView.durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
        heroView.combatLabel.text = "Combat: \(hero.powerstats.combat)"
        
        if let url = URL(string: hero.images.md) {
            loadImage(from: url)
        }
    }
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Ошибка загрузки изображения: \(error?.localizedDescription ?? "нет данных")")
                return
            }
            DispatchQueue.main.async {
                self?.heroView.imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    @objc func randomizeAction() {
        fetchSuperHeroData(id: Int.random(in: 1...700))
    }
}
