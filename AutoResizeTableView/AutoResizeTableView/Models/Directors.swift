//
//  Songs.swift
//  AutoResizeTableView
//
//  Created by Abhishek Shukla on 18/05/19.
//  Copyright © 2019 Abhishek Shukla. All rights reserved.
//

import UIKit

struct Directors : Codable {
    let directors : [Director]
}

struct Director: Codable {
    let name: String
    let bio: String
    let source: String
    let image: String
    var films: [Film]
    
    // Decode JSON
    static func auteursFromBundle() -> [Director] {
        var auteurs: [Director] = []
        let url = Bundle.main.url(forResource: "directors", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Directors.self, from: data)
            auteurs = json.directors
        }
        catch {
            print("Error occured during Parsing", error)
        }
        return auteurs
    }
}
