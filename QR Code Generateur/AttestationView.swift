//
//  AttestationView.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 13/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI
import WebKit


struct AttestationView: View {
    @Binding var choixMotif: Int
    @Binding var dateEdition: Date
    
    @EnvironmentObject var settings: Donnees
    
    var body: some View {
        ZStack {
            
            
            // Lecture du fichier PDF
            containedView(index: 1)
                .offset(y:-20)
            
            // Identite
            Group {
                HStack {
                    Text(settings.identite.prenom)
                    .offset(x: -80, y: -242)
                    .font(.system(size: 6))
                    
                    Text(settings.identite.nom)
                    .offset(x: -85, y: -242)
                    .font(.system(size: 7))
                }
                
                Text(settings.identite.dateDeNaissance)
                .offset(x: -85, y: -228)
                .font(.system(size: 7))
                
                Text(settings.identite.lieuDeNaissance)
                .offset(x: -100, y: -214)
                .font(.system(size: 7))
                
                Text("\(settings.identite.adresse) \(settings.identite.departement) \(settings.identite.ville)")
                .offset(x: -20, y: -198)
                .font(.system(size: 7))
                
            }
            
            // Cases à Cocher
            Group {
                
                if choixMotif == 0 {
                        Text("X")
                        .offset(x: -131, y: -147)
                        .font(.system(size: 10))
                }
                
                if choixMotif == 1 {
                    Text("X")
                        .offset(x: -131, y: -117)
                        .font(.system(size: 10))
                }
                
                if choixMotif == 2 {
                    Text("X")
                        .offset(x: -131, y: -93)
                        .font(.system(size: 10))
                }
                if choixMotif == 3 {
                    Text("X")
                        .offset(x: -131, y: -71)
                        .font(.system(size: 10))
                }
                if choixMotif == 4 {
                    Text("X")
                        .offset(x: -131, y: -37)
                        .font(.system(size: 10))
                }
                if choixMotif == 5 {
                    Text("X")
                        .offset(x: -131, y: -8)
                        .font(.system(size: 10))
                }
                if choixMotif == 6 {
                    Text("X")
                        .offset(x: -131, y: 13)
                        .font(.system(size: 10))
                }
            }
            
            // Bas de page
            Text(settings.identite.ville)
            .offset(x: -100, y: 36)
            .font(.system(size: 7))
            
            Text(date(date: dateEdition))
            .font(.system(size: 7))
            .offset(x: -100, y: +50)
            
            Text(heure(date: dateEdition))
            .font(.system(size: 7))
            .offset(x: -60, y: +50)
            
            Text(minute(date: dateEdition))
            .font(.system(size: 7))
            .offset(x: -40, y: +50)
            
            Text("Date de creation:")
            .font(.system(size: 4))
            .frame(width: 50, height: 10)
            .background(Color.white)
            .offset(x: +110, y: +85)
            
            Text(dateA(date: dateEdition))
            .font(.system(size: 4))
            .offset(x: +110, y: +90)
            .foregroundColor(.black)
        }
    }
    
    func containedView(index: Int) -> WebView {
        switch index {
        case 0:
            return WebView(request: openWeb())
        case 1:
            return WebView(request: openPDF())
        default:
            return WebView(request: openPDF())
        }
    }
    
    func openWeb() -> URLRequest {
        let url = URL(string: "https://www.apple.com")
        return URLRequest(url: url!)
    }
    
    func openPDF() -> URLRequest {
        let path = Bundle.main.path(forResource: "Attestation", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        return URLRequest(url: url)
    }
}

struct AttestationView_Previews: PreviewProvider {
    static var previews: some View {
        AttestationView(choixMotif: .constant(0), dateEdition: .constant(Date()))
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

