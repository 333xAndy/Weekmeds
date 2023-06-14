//
//  ContentView.swift
//  Xcode - Weekmeds
//
//  Created by Andy De Leon on 6/6/23.
//

import SwiftUI

//TODO add more to the stack, then create setttings, then connect to main view


struct Medication: Identifiable{
    var id = UUID()
    var name:String
    var strength:String
    var amount:String
    var method:String
    var time:String
    var pharmacyPhone: String
    var refillReminder: Date //not sure if this is a string but check on that
    //also add a way to upload prescription to app
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Add your prescription..").navigationTitle("Home").navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: DetailAddView()) {
                                Text("Add")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: DetailSettingsView()) {
                                Text("Settings")
                            }
                        }
                    }
                //Medication List view goes here
            }
        }
    }
}


//Details look small so make sure to fixt that
struct DetailAddView : View{
    @State private var nme: String=""
    @State private var strnth: String=""
    @State private var amnt: String=""
    @State private var mthod: String=""
    @State private var tme: String=""
    @State private var pharmPhone: String=""
    @State private var date = Date()
    var body: some View{
        VStack{
            Text("Presciption Name").font(.title3)
            HStack{
                Image(systemName: "pills.circle")
                TextField("Enter..",text:$nme)
            }

        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading).navigationTitle(Text("Add")).navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailSettingsView : View{
    var body: some View{
        Text("Hello from S")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

