//
//  Loan_Management_SwiftApp.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

@main
struct Loan_Management_SwiftApp: App {
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                LoanListView()
                    .navigationDestination(for: Route.self) { route in
                        switch(route){
                            case .detailView(let loan):
                                DetailView(loan: loan)
                            case .documentView(let url):
                                DocumentView(url: url)
                        }
                    }
            }
            .environmentObject(router)
        }
        
    }
}
