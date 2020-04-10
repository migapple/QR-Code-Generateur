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
    
    var body: some View {
        VStack {
            
//        Text("\(editTexte(motif: motifs[choixMotif], dateEdition: dateEdition))")
        
            Image(uiImage: UIImage(data: returnData(str: editTexte(motif: motifs[choixMotif], dateEdition: dateEdition)))!)
                            .resizable()
                            .frame(width: 300, height: 300)
        }
    .navigationBarBackButtonHidden(true)
    }
    
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(choixMotif: .constant(0), dateEdition: .constant(Date()))
    }
}
