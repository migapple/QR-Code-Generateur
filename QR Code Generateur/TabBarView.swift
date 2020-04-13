//
//  NavigationView.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 12/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @State var choixMotif = 0
    @State var dateEdition = Date()
    
    @EnvironmentObject var settings: Donnees
    
    var body: some View {
        VStack {
            Text("COVID-19")
            Text("QRCode de déplacement")
            Text("Non validé par le gouvernement")
            TabView {
                MotifView(choixMotif: $choixMotif, dateEdition: $dateEdition)
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Motif")
                }
                
                QRCodeView(choixMotif: $choixMotif, dateEdition: $dateEdition)
                    .tabItem {
                        Image(systemName: "barcode")
                        Text("QRCode")
                }
                
                IdentiteView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Identite")
                }
            }
            .onAppear {
                guard let Retreive1 = UserDefaults.standard.value(forKey: "nom") else { return }
                self.settings.identite.nom = Retreive1 as! String
                guard let Retreive2 = UserDefaults.standard.value(forKey: "prenom") else { return }
                self.settings.identite.prenom = Retreive2 as! String
                guard let Retreive3 = UserDefaults.standard.value(forKey: "dateDeNaissance") else { return }
                self.settings.identite.dateDeNaissance = Retreive3 as! String
                guard let Retreive4 = UserDefaults.standard.value(forKey: "lieuDeNaissance") else { return }
                self.settings.identite.lieuDeNaissance = Retreive4 as! String
                guard let Retreive5 = UserDefaults.standard.value(forKey: "adresse") else { return }
                self.settings.identite.adresse = Retreive5 as! String
                guard let Retreive6 = UserDefaults.standard.value(forKey: "ville") else { return }
                self.settings.identite.ville = Retreive6 as! String
                guard let Retreive7 = UserDefaults.standard.value(forKey: "codePostal") else { return }
                self.settings.identite.departement = Retreive7 as! String
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
