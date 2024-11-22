//
//  SuperheroModel.swift
//  task10
//
//  Created by Алан Абзалханулы on 21.11.2024.
//
import Foundation

struct SuperHero: Codable{
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let images: Image
}

struct Powerstats: Codable{
    var intelligence: Int
    var power: Int
    var speed: Int
    var durability: Int
    var combat: Int
}

struct Biography: Codable{
    var fullName: String
    var alterEgos: String
    var placeOfBirth: String
    var firstAppearance: String
    var publisher: String
}

struct Image: Codable{
    var md: String
}
