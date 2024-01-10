//
//  LogVIew.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import SwiftUI

struct LogVIew: View {
    @EnvironmentObject var userData: UserData
    @State private var userName = ""
    @State private var password = ""
    @State private var goToMainView = false
    @State private var isActiveAlert = false
    @State private var isActiveSheetRegistred = false
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("")){
                        TextField("Enter your username", text: $userName)
                    }
                    Section(header: Text("")){
                        TextField("Enter your password", text: $password)
                    }
                }
                Button("Done", action: {checkPasswordAndUserName(userName: userName, password: password)}).buttonStyle(BorderedButtonStyle())
                    .alert(isPresented: $isActiveAlert, content: {
                        Alert(title: Text("Erorr"), message: Text("Please enter the details"))
                    })
                
            }
            .background(
                NavigationLink(destination: MainView(), isActive: $goToMainView, label: { EmptyView() })
                
            )
            .sheet(isPresented: $isActiveSheetRegistred){
                
            }
            .navigationTitle("Log in")
            .navigationBarItems(trailing: HStack {
                Button(action: {isActiveSheetRegistred.toggle()} ){
                    Image(systemName: "person.fill.badge.plus")
                }
            })
        
        }
    }
    private func checkPasswordAndUserName(userName: String, password: String){
        guard !password.isEmpty && !userName.isEmpty else {
            isActiveAlert.toggle()
            return
        }
        guard userData.user.userName == userName && userData.user.password == password else {
            isActiveAlert.toggle()
            return
        }
        goToMainView.toggle()
        userData.user.isRegistred = true
    }
}

#Preview {
    LogVIew()
        .environmentObject(UserData())
}
