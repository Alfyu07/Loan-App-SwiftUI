//
//  LMLoanCard.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LMLoanCard: View {
    let loan: Loan
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    LMTitleLabel("\(loan.amount)".toRupiahFormat() ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    LMCalloutLabel("Jangka waktu \(loan.term) bulan")
                }
                VStack(alignment: .center, spacing: 4){
                    LMTitleLabel( loan.riskRating, alignment: .center)
                        .font(.title2)
                        .fontWeight(.semibold)
                    LMCalloutLabel("\(loan.interestRate)% interest")
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
                
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .background(Color(UIColor.systemGray5))
                .padding(.top, 4)
                .padding(.bottom, 4)
                .padding(.trailing)
                .padding(.leading)
            
            HStack{
                LMTitleLabel(loan.borrower.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LMCalloutLabel(loan.purpose)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .padding(.leading)
        .padding(.trailing)
        
    }
}
