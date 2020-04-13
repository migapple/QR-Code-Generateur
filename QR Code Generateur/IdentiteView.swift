//
//  IdentiteView.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 11/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct IdentiteView: View {
    @EnvironmentObject var settings: Donnees
    
    var body: some View {
        
        VStack {
//            NavigationView {
//                Form {
                    TextField("Nom", text: $settings.identite.nom)
                    TextField("Prenom", text: $settings.identite.prenom)
                    TextField("Date de Naissance", text: $settings.identite.dateDeNaissance)
                    TextField("Lieu de Naissance", text: $settings.identite.lieuDeNaissance)
                    TextField("Adresse", text: $settings.identite.adresse)
                    TextField("Ville", text: $settings.identite.ville)
                    TextField("Code Postal", text: $settings.identite.departement)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            UserDefaults.standard.set(self.settings.identite.nom, forKey: "nom")
                            UserDefaults.standard.set(self.settings.identite.prenom, forKey: "prenom")
                            UserDefaults.standard.set(self.settings.identite.dateDeNaissance, forKey: "dateDeNaissance")
                            UserDefaults.standard.set(self.settings.identite.lieuDeNaissance, forKey: "lieuDeNaissance")
                            UserDefaults.standard.set(self.settings.identite.adresse, forKey: "adresse")
                            UserDefaults.standard.set(self.settings.identite.ville, forKey: "ville")
                            UserDefaults.standard.set(self.settings.identite.departement, forKey: "codePostal")
                        }) {
                            Text("Validation")
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
//                }
//                .navigationBarTitle("Identite")
//            }
            Spacer()
        }
    }
}


struct IdentiteView_Previews: PreviewProvider {
    static var previews: some View {
        IdentiteView()
    }
}
