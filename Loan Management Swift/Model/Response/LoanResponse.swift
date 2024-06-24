//
//  Loan.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct LoanResponse: Codable{
    var id: String
    var amount: Int
    var interestRate: Double
    var term: Int
    var purpose: String
    var riskRating: String
    var borrower: BorrowerResponse
    var collateral: CollateralResponse
    var documents: [DocumentResponse]?
    var repaymentSchedule: RepaymentScheduleResponse
}
