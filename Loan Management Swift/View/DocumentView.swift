//
//  DocumentView.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct DocumentView: View {
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        Text("Document View")
    }
}

#Preview {
    DocumentView(url: "Test")
}
