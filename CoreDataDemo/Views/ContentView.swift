//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var contacts: FetchedResults<ContactEntity>
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List (contacts, id: \.self) {contact in
                VStack(alignment: .leading) {
                    Text(contact.name ?? "Unknown")
                    Text(contact.mobile ?? "Unknown")
                }
            }
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Add")
                }
            }
            .navigationTitle("Contact Book")
        }
        .sheet(isPresented: $isPresented) {
            AddContact()
        }
    }
}

#Preview {
    ContentView()
}
