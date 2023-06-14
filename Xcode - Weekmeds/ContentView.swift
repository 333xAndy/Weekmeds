//
//  ContentView.swift
//  Xcode - Weekmeds
//
//  Created by Andy De Leon on 6/6/23.
//

import SwiftUI

//Create Settins page, upload to firebase, display on View Page


struct Medication: Identifiable{
    var id = UUID()
    var name:String
    var strength:String
    var amount:String
    var method:String
    var time:String
    var pharmacyPhone: String
    var refillReminder: Date 
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
            HStack{
                Text("Presciption Name").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                Text("Strength (mg/ml)").font(.title3).frame(maxWidth: .infinity, alignment: .center)
            }
            HStack{
                Image(systemName: "pills.circle")
                TextField("Name..",text:$nme)
                TextField("Strength..",text: $strnth).keyboardType(.numberPad)
                Spacer()
            }
            Text("Drug Instructions").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName:"pencil.circle")
                TextField("Amount",text:$amnt)
                TextField("Method",text:$mthod)
                TextField("Daily/Weekly/Etc,",text:$tme)
                Spacer()
            }
            Text("Pharmacy Phone").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "phone.circle")
                TextField("Phone #",text: $pharmPhone).keyboardType(.numberPad)
            }
            Text("Refill date").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "calendar.circle")
                DatePicker(selection: $date, displayedComponents: .date){
                    Text("Select a date")
                }
            }
            Text("Upload your prescription").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "camera.circle")
                Button("Upload image.."){
                    
                }
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

