//
//  MotifView.swift
//  QR Code Generateur
//
//  Created by Michel Garlandat on 12/04/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct MotifView: View {
    
    @Binding  var choixMotif: Int
    @Binding  var dateEdition: Date
        
    let formatter = DateFormatter()
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
                List {
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
                
//                Text(dateA(date: dateEdition))
                
                Spacer()
                
//                Text("\(editTexte(motif: motifs[choixMotif], dateEdition: dateEdition))")
                
            }.padding()
                .navigationBarTitle("Motif")
        }
    }
}

struct MotifView_Previews: PreviewProvider {
    @Binding  var dateEdition: Date
    static var previews: some View {
        MotifView(choixMotif: .constant(2) , dateEdition: .constant(Date()))
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
