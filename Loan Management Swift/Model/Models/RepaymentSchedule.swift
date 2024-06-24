//
//  RepaymentSchedule.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct RepaymentSchedule: Codable, Hashable{
    var installments: [Installment]?
}

struct Installment: Codable, Hashable, Identifiable{
    var id: UUID
    var dueDate: String
    var amountDue: Int
}
