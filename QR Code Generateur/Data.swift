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

func editTexte(motif: String, dateEdition: Date) -> String {
    var texte1 = "Cree le: "
    var texte2 = texte1 + dateA(date: dateEdition)
    var texte3 = texte2 + "; Nom: Garlandat; Prenom: Michel; Naissance: 27/08/1953 a Villeneuve Saint Georges; Adresse: 26 Avenue Victor Hugo 92220 Bagneux; Sortie: "
    var texte4 = texte3 + dateA(date: dateEdition)
    var texte5 = texte4 + "; Motifs: "
    var texte6 = texte5 + motif
    
    return texte6
}

//func returnData(str: String) -> Data {
//    let filter = CIFilter(name: "CIQRCodeGenerator")
//    let data = str.data(using: .ascii, allowLossyConversion: false)
//    filter?.setValue(data, forKey: "inputMessage")
//    let image = filter?.outputImage
//    let uiimage = UIImage(ciImage: image!)
//    return uiimage.pngData()!
//}

func dateA(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/YYYY HH:mm"
    let dateStr = formatter.string(from: date)
    let replaced = dateStr.replacingOccurrences(of: " ", with: " a ")
    let replaced2 = replaced.replacingOccurrences(of: ":", with: "h")
    return replaced2
}
