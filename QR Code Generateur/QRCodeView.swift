//
//  QRCodeView().swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 10/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct QRCodeView: View {
    @Binding var choixMotif: Int
    @Binding var dateEdition: Date
    
    @EnvironmentObject var settings: Donnees
    
    var body: some View {
        VStack {
            
//            Text("\(editTexte(identite: settings, motif: motifs[choixMotif], dateEdition: dateEdition))")
        
            Image(uiImage: UIImage(data: returnData(str: editTexte(identite: settings, motif: motifs[choixMotif], dateEdition: dateEdition)))!)
                            .resizable()
                            .frame(width: 300, height: 300)
        }
    }
    
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
    
        func editTexte(identite: Donnees, motif: String, dateEdition: Date) -> String {
        let texte1 = "Cree le: "
        let texte2 = texte1 + dateA(date: dateEdition)
            let texte3 = texte2 + "; Nom: \(settings.identite.nom); Prenom: \(settings.identite.prenom); Naissance: \(settings.identite.dateDeNaissance) a \(settings.identite.lieuDeNaissance); Adresse: \(settings.identite.adresse) \(settings.identite.departement) \(settings.identite.ville); Sortie: "
        let texte4 = texte3 + dateA(date: dateEdition)
        let texte5 = texte4 + "; Motifs: "
        let texte6 = texte5 + motif
        return texte6
    }

}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(choixMotif: .constant(0), dateEdition: .constant(Date()))
    }
}
