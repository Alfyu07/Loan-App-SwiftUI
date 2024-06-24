//
//  LMTitleLabel.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LMTitleLabel: View {
    let text: String
    let alignment: TextAlignment
    let fontWeight: Font.Weight
    
    init(_ text: String, alignment: TextAlignment = .leading, fontWeight: Font.Weight = .semibold) {
        self.text = text
        self.alignment = alignment
        self.fontWeight = fontWeight
    }
    var body: some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(fontWeight)
            .multilineTextAlignment(alignment)
            .foregroundColor(Color(UIColor.label))
            .clipped()
    }
}

#Preview {
    LMTitleLabel("Rp.5.000.000")
}
