//
//  ContentView.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 10/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    enum Motif: String, CaseIterable {
//        case depl = "travail"
//        case cour = "courses"
//        case sant = "sante"
//        case rais = "famille"
//        case spor = "sport"
//        case judi = "judiciaire"
//        case inte = "missions"
//    }
//
//    let dateFormat : DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/YYYY HH:mm"
//        formatter.locale = Locale(identifier: "fr_FR")
//        return formatter
//    }()
//
//    let motifs = Array(Motif.allCases)
    
//    let motifs = [ "travail","courses","sante","famille","sport","judiciaire",
//    "missions"]
    
    @State private var choixMotif = 0
    
    @State private var dateEdition = Date()
    
//    var txt = "Cree le: 10/04/2020 a 07h42; Nom: Garlandat; Prenom: Michel; Naissance: 27/08/1953 a Villeneuve Saint Georges; Adresse: 26 Avenue Victor Hugo 92220 Bagneux; Sortie: 10/04/2020 a 07h41; Motifs: courses"
    
    let formatter = DateFormatter()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
                List {
                    NavigationLink(destination: QRCodeView(choixMotif: $choixMotif, dateEdition: $dateEdition)) {
                        Text("QRCode")
                    }
                    Section {
                        Picker(selection: $choixMotif, label: Text("")) {
                            ForEach(0 ..< motifs.count) {
                                Text(motifs[$0])
                            }
                        }
                    }
                }
                .frame(minHeight: 200)
                
                Form {
                    DatePicker2(date: $dateEdition)
                }
                .frame(minHeight: 300)
                
                Text(dateA(date: dateEdition))
                
                Spacer()
                
                Text("\(editTexte(motif: motifs[choixMotif], dateEdition: dateEdition))")
                
//                Image(uiImage: UIImage(data: returnData(str: editTexte(motif: motifs[choixMotif])))!)
//                    .resizable()
//                    .frame(width: 300, height: 300)
            }.padding()
        }
    }
    
//    func editTexte(motif: String) -> String {
//        var texte1 = "Cree le: "
//        var texte2 = texte1 + dateA(date: dateEdition)
//        var texte3 = texte2 + "; Nom: Garlandat; Prenom: Michel; Naissance: 27/08/1953 a Villeneuve Saint Georges; Adresse: 26 Avenue Victor Hugo 92220 Bagneux; Sortie: "
//        var texte4 = texte3 + dateA(date: dateEdition)
//        var texte5 = texte4 + "; Motifs: "
//        var texte6 = texte5 + motif
//        
//        return texte6
//    }
//    
//    func returnData(str: String) -> Data {
//        let filter = CIFilter(name: "CIQRCodeGenerator")
//        let data = str.data(using: .ascii, allowLossyConversion: false)
//        filter?.setValue(data, forKey: "inputMessage")
//        let image = filter?.outputImage
//        let uiimage = UIImage(ciImage: image!)
//        return uiimage.pngData()!
//    }
//    
//    func dateA(date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/YYYY HH:mm"
//        let dateStr = formatter.string(from: date)
//        let replaced = dateStr.replacingOccurrences(of: " ", with: " a ")
//        let replaced2 = replaced.replacingOccurrences(of: ":", with: "h")
//        return replaced2
//    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DatePicker2: UIViewRepresentable {
    @Binding var date: Date

    private let datePicker = UIDatePicker()

    func makeUIView(context: Context) -> UIDatePicker {
        let loc = Locale(identifier: "fr_FR")
        datePicker.locale = loc
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.changed(_:)), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        datePicker.date = date
    }

    func makeCoordinator() -> DatePicker2.Coordinator {
        Coordinator(date: $date)
    }

    class Coordinator: NSObject {
        private let date: Binding<Date>

        init(date: Binding<Date>) {
            self.date = date
        }

        @objc func changed(_ sender: UIDatePicker) {
            self.date.wrappedValue = sender.date
        }
    }
}

