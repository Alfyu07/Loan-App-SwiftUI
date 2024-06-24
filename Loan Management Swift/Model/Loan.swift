//
//  Loan.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
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
