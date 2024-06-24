//
//  ContentView.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LoanListView: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = LoanListViewModel()
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 0){
                title
                loanlist
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
        .padding()
        .onAppear{
            vm.getLoans()
        }
    }
}

extension LoanListView {
    var title : some View {
        HStack{
            Text("List Peminjam")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button{
                print("filter")
            }label:{
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
    }
    
    var loanlist: some View {
        
        VStack{
            if vm.isLoading {
                VStack{
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2.0)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            }else if vm.loans.isEmpty{
                VStack{
                    Spacer()
                    Text("Tidak terdapat list pinjaman")
                    Spacer()
                }
            }else {
                ForEach(vm.loans, id: \.id){ loan in
                    LMLoanCard(loan: loan)
                        .padding(.top, loan != vm.loans.first ? 10 : 0)
                        .onTapGesture {
                            router.push(.detailView(loan: loan))
                        }
                }
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top)
        .ignoresSafeArea()
        
    }
}


