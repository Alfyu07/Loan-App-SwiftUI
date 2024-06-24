//
//  Mapper.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import Foundation

enum Mapper {
    static func mapLoanResponseToModel(from input: LoanResponse) -> Loan {
        return Loan(
            id: input.id,
            amount: input.amount,
            interestRate: input.interestRate,
            term: input.term,
            purpose: input.purpose,
            riskRating: input.riskRating,
            borrower: mapBorrowerResponseToModel(from: input.borrower),
            collateral: mapCollateralResponseToModel(from: input.collateral),
            documents: input.documents?.map({ document in
                mapDocumentResponseToModel(from: document)
            }),
            repaymentSchedule: mapRepaymentScheduleToModel(from: input.repaymentSchedule)
        )
    }
    
    static func mapDocumentResponseToModel(from input: DocumentResponse) -> Document {
        return Document(id: UUID(), type: input.type, url: input.url)
    }
    
    static func mapBorrowerResponseToModel(from input: BorrowerResponse) -> Borrower {
        return Borrower(id: input.id, name: input.name, email: input.email, creditScore: input.creditScore)
    }
    
    static func mapCollateralResponseToModel(from input: CollateralResponse) -> Collateral {
        return Collateral(id: UUID(), type: input.type, value: input.value)
    }
    
    static func mapInstallmentResponseToModel(from input: InstallmentResponse) -> Installment {
        return Installment(id:  UUID(), dueDate: input.dueDate, amountDue: input.amountDue)
    }
    
    static func mapRepaymentScheduleToModel(from input: RepaymentScheduleResponse) -> RepaymentSchedule {
        let installments = input.installments?.map({ item in
            mapInstallmentResponseToModel(from: item)
        })
        return RepaymentSchedule(installments: installments)
    }
    
    
    
     
    
    
}

enum BorrowerMapper{
    
}
