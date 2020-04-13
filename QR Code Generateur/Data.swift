//
//  Data.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 10/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import Foundation

let motifs = [ "travail","courses","sante","famille","sport","judiciaire",
"missions"]

struct Identite: Identifiable, Codable {
    let id = UUID()
    var nom: String
    var prenom: String
    var dateDeNaissance: String
    var lieuDeNaissance: String
    var adresse: String
    var ville: String
    var departement: String
}

class Donnees: ObservableObject {
    @Published var identite = Identite(nom: "", prenom: "", dateDeNaissance: "", lieuDeNaissance: "", adresse: "", ville: "", departement: "")
}

func dateA(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/YYYY HH:mm"
    let dateStr = formatter.string(from: date)
    print(dateStr)
    let replaced = dateStr.replacingOccurrences(of: " ", with: " a ")
    let replaced2 = replaced.replacingOccurrences(of: ":", with: "h")
    return replaced2
}

func date(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/YYYY"
    let dateStr = formatter.string(from: date)
    return dateStr
}

func heure(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    let dateStr = formatter.string(from: date)
    return dateStr
}

func minute(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "mm"
    let dateStr = formatter.string(from: date)
    return dateStr
}


