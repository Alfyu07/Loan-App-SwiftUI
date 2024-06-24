//
//  Router.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

enum Route: Hashable {
    case detailView(loan: Loan)
    case documentView(url: String)
}

final class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    public func toRoot(){
        path = .init()
    }
    
    public func pop(){
        path.removeLast()
    }
    
    public func push(_ route: Route){
        path.append(route)
    }
}
