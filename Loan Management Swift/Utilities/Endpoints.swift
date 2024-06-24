//
//  Endpoints.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//


import Foundation

enum API: String {
    case baseUrl = "https://raw.githubusercontent.com/andreascandle/p2p_json_test/main/"
}

protocol Endpoint {
    var url: String {get}
}
enum Endpoints {
    enum Gets: Endpoint {
        case getLoans
        public var url: String {
            switch self {
                case .getLoans: return "\(API.baseUrl.rawValue)api/json/loans.json"
            }
        }
    }
    
}
