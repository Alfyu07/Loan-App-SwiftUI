//
//  LMDocumentCard.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LMDocumentCard: View {
    @EnvironmentObject var router: Router
    
    let document: Document
    
    var body: some View{
        HStack{
            LMBodyLabel(document.type)
                .padding(.trailing, 8)
            Spacer()
            Button{
                router.push(.documentView(url: document.url))
            }label: {
                HStack{
                    Text("Lihat")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}
