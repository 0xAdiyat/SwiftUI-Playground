//
//  AccountView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack{
            Form {
                
                Section {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("E-mail", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker("Date of Birth", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                        
                    }label: {
                
                        Text("Save Changes")
                    }
                }header: {
                    
                    Text("Personal Info")
                }
                .tint(.appetizersAccent)

                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)

                }header: {
                    Text("Requests")
                }
                .tint(.appetizersAccent)

                
            }
            .navigationTitle("Account")
            
        }
        .onAppear{
            viewModel.retrieveUser()

        }
        .alert(item: $viewModel.alertItem, content: { item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
            
        })
    }
}

#Preview {
    AccountView()
}
