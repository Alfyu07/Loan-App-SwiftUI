//
//  Loan.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import Foundation

struct Loan: Codable, Hashable{
    var id: String
    var amount: Int
    var interestRate: Double
    var term: Int
    var purpose: String
    var riskRating: String
    var borrower: Borrower
    var collateral: Collateral
    var documents: [Document]?
    var repaymentSchedule: RepaymentSchedule
}
