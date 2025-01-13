//
//  AddContact.swift
//  CoreDataDemo
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

struct AddContact: View {
    @State var name: String = ""
    @State var phone: String = ""
    @State var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func addContact() {
        if name.isEmpty || phone.isEmpty {
            showAlert.toggle()
            return
        }
        
        let newContact = ContactEntity(context: managedObjectContext)
        newContact.name = name
        newContact.mobile = phone
        
        try? managedObjectContext.save()
        dismiss()
    }
    
    var body: some View {
        VStack {
            HStack {
                Button("Dismiss") {
                    dismiss()
                }
                .foregroundStyle(.red)
                Spacer()
                Text("Add New Contact")
                    .font(.headline)
                Spacer()
                Button("Add") {
                   addContact()
                }
                .alert("Fill in all fields", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        showAlert = false
                    }
                }

            }
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Phone", text: $phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AddContact()
}
