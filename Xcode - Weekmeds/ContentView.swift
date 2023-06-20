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

class MedicationViewModel: ObservableObject{
    @Published var meds = [Medication]()
}

struct ContentView: View {
    
    @StateObject var viewModel = MedicationViewModel()
    
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
                            NavigationLink(destination: DetailSettingsView()){
                                Text("Settings")
                            }
                        }
                }
            }
        }
    }
}


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
            }.padding()
            Text("Drug Instructions").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName:"pencil.circle")
                TextField("Amount",text:$amnt)
                TextField("Method",text:$mthod)
                TextField("Daily/Weekly/Etc,",text:$tme)
                Spacer()
            }.padding()
            HStack{
                Image(systemName: "phone.circle")
                Text("Pharmacy Phone").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                TextField("Phone #",text: $pharmPhone).keyboardType(.numberPad)
            }.padding()
            HStack{
                Image(systemName: "calendar.circle")
                Text("Refill date").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                DatePicker(selection: $date, displayedComponents: .date){}
            }.padding()
            HStack{
                Image(systemName: "camera.circle")
                Text("Upload your prescription").font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                Button("Upload image.."){
                }
            }.padding()
            HStack{
                Button(action: self.tryToAddToList){
                    Text("Add to list").bold().frame(width: 250, height: 50, alignment: .center).cornerRadius(8).background(Color.green).foregroundColor(Color.white)
                }
            }
            
            
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading).navigationTitle(Text("Add")).navigationBarTitleDisplayMode(.inline)
    }
    
    func tryToAddToList(){
        guard !nme.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        //append to view model here
    }
}

//connect these to actual functions
struct DetailSettingsView : View{
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var fontSize:Int=16
    @State private var fireStore = false
    let fontSelect = [16, 24, 32, 48]
    var body: some View{
        NavigationView{
            Form{
                Section(header:Text("Display")){
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    Picker("Font Size", selection: $fontSize){
                        ForEach(fontSelect, id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.menu)
                }
                Section(header:Text("Privacy"), footer:Text("When turned on, images will be stored on Google Firebase. Select off to store in camera roll")){
                    Toggle("Google Firebase", isOn: $fireStore)
                }
            }
        }.navigationTitle("Settings").navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

