//
//  DetailView.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//
import SwiftUI

struct DetailView: View {
    let loan: Loan
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                repaymentSection
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: 24)
                    .background(Color(UIColor.systemGray5))
                borrowerSection
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: 24)
                    .background(Color(UIColor.systemGray5))
                
                documentSection
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(Text("Rincian Peminjaman"))
        
    }
}

extension DetailView{
    var repaymentSection: some View {
        VStack(alignment: .leading, spacing: 16){
            LMTitleLabel("Tagihan", alignment: .leading)
            
            ForEach(loan.repaymentSchedule.installments ?? []){ item in
                LMRepaymentCard(installment: item)
            }
        }
        .padding()
    }
    
    var borrowerSection: some View {
        VStack(alignment: .leading, spacing: 12){
            LMTitleLabel("Informasi Peminjam")
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    LMBodyLabel("Nama peminjam")
                    Spacer()
                    LMBodyLabel(loan.borrower.name)
                }
                .frame(maxWidth: .infinity)
                
                HStack{
                    LMBodyLabel("Email")
                    Spacer()
                    LMBodyLabel(loan.borrower.email)
                }
                .frame(maxWidth: .infinity)
                
                HStack{
                    LMBodyLabel("Jenis Jaminan")
                    Spacer()
                    LMBodyLabel(loan.collateral.type)
                }
                .frame(maxWidth: .infinity)
                
                HStack{
                    LMBodyLabel("Nilai Jaminan")
                    Spacer()
                    LMBodyLabel("\(loan.collateral.value)".toRupiahFormat() ?? "Rp0")
                }
                .frame(maxWidth: .infinity)
                
                HStack{
                    LMBodyLabel("Credit Score")
                    Spacer()
                    LMBodyLabel("96")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var documentSection: some View {
        VStack(alignment: .leading){
            LMTitleLabel("Dokumen")
            
            if let documents = loan.documents {
                if documents.isEmpty {
                    ContentUnavailableView(LMError.noDocument.rawValue, systemImage: "doc.richtext.fill")
                }else {
                    ForEach(loan.documents!, id: \.id){ document in
                        LMDocumentCard(document: document)
                    }
                }
            }
            
            
        }
        .padding()
    }
}





