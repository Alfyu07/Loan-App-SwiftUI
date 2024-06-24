//
//  Borrower.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct Borrower: Codable, Hashable{
    var id: String
    var name: String
    var email: String
    var creditScore: Double
}
