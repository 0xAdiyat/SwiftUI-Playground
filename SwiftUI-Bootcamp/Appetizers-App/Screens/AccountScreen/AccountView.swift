//
//  AccountView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState  var focusedTextField: FormTextField?
    
  
    
    var body: some View {
        NavigationStack{
            Form {
                
                Section {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)

                    TextField("E-mail", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
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
            .toolbar{
                ToolbarItemGroup(placement:.keyboard){
                    Button("Dismiss"){
                        focusedTextField = nil
                    }
                }
            }
            
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
