//
//  LMBodyLabel.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LMBodyLabel: View {
    let text: String
    let alignment: TextAlignment
    let fontWeight: Font.Weight
    
    init(_ text: String, alignment: TextAlignment = .leading, fontWeight: Font.Weight = .regular) {
        self.text = text
        self.alignment = alignment
        self.fontWeight = fontWeight
    }
    
    var body: some View {
        Text(text)
            .font(.body)
            .multilineTextAlignment(alignment)
            .fontWeight(fontWeight)
            .foregroundColor(Color(UIColor.label))
            .lineLimit(4)
            .clipped()
    }
}


