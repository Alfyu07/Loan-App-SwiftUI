//
//  LMRepaymentCard.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LMRepaymentCard: View {
    let installment: Installment
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 0){
                LMBodyLabel(installment.dueDate.monthName() ?? "")
                Text("Jatuh tempo \(installment.dueDate.formattedFullDate() ?? "")")
                    .font(.system(size: 14))
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            LMTitleLabel("\(installment.amountDue)".toRupiahFormat() ?? "")
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 12)
        
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        
    }
}
