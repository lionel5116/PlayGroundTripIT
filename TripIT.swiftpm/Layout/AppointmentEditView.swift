import SwiftUI

struct AppointmentEditView : View {
    @State var _arrAppData: [Appointment] = []
    var itemToEdit: Appointment?
    @State private var showAlert = false
    
    @State private var recID = "";
    @State private var AppDate = "";
    @State private var AppType = "";
    @State private var ContactPerson = "";
    @State private var ContactPhone = "";
    @State private var Status = "";
    @State private var Location = "";
    @State private var Cost = "";
    @State private var Notes = "";
    
    //dismiss the keyboard
    @Environment(\.dismiss) private var dismiss
    
    private let appTypes: [String] = [
        "Tour",
        "Session",
        "Meeting",
        "FTPower"
    ]
    
    private let Statuses: [String] = [
        "Pending",
        "Booked",
        "Complete",
    ]
    
    //init(appointmentItem:Appointment, itemToEdit:Appointment? = nil) {
    init( itemToEdit:Appointment? = nil) {
        //self.init(appointmentItem: appointmentItem)
        self.itemToEdit = itemToEdit
        
        if let _itemToEdit = itemToEdit {
            _recID = State(initialValue: _itemToEdit._id)
            _AppDate = State(initialValue: _itemToEdit.AppDate)
            _AppType = State(initialValue: _itemToEdit.AppType)
            _ContactPerson  = State(initialValue: _itemToEdit.ContactPerson)
            _ContactPhone  = State(initialValue: _itemToEdit.ContactPhone)
            _Status  = State(initialValue: _itemToEdit.Status)
            _Location  = State(initialValue: _itemToEdit.Location)
            _Cost  = State(initialValue: String(_itemToEdit.Cost!))
            _Notes  = State(initialValue: _itemToEdit.Notes)
        }
    }//init
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Appointments")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Picker("Appointment Type",
                       selection: $AppType) {
                    ForEach(appTypes, id: \.self) {
                        appType in
                        Text(appType)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
                TextField("Date",text:$AppDate)
                    .padding().frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                
                TextField("Contact Person",text:$ContactPerson)
                    .padding().frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                
                TextField("Contact Phone",text:$ContactPhone)
                    .padding().frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                
                TextField("Location",text:$Location)
                    .padding().frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                
                ReusableTextControl(title: "Cost", _Text: $Cost, backgroundColor: Color.black.opacity((0.05)), frameWidth: 300, frameHeight: 50, cornerRadius: 10,_borderColor: .blue)
                
                /*
                TextField("Cost",text:$Cost)
                    .padding().frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                 */
                
                Picker("Status",
                       selection:$Status) {
                    ForEach(Statuses, id: \.self) {
                        status in
                        Text(status)
                    }
                }.pickerStyle(.segmented).padding()
                
                TextEditor(text: $Notes)
                    .padding()
                    .padding().frame(width: 300, height: 200)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(Color(uiColor: .blue))
                
                Button("Update") {
                    updateAppointment(id: recID)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .alert("Record Updated",isPresented: $showAlert) {
                    Button("Update Successful"){}
                }
                
                       
            }//VStack
        
        }//ZStack
    }//var body
    
    enum MyError: Error {
        case runtimeError(String)
    }
    func updateAppointment(id:String) {
        var body: [String: Any] = [:]
        
        body=["AppDate":"\(AppDate)","AppType":"\(AppType)","ContactPerson":"\(ContactPerson)","ContactPhone":"\(ContactPhone)","Status":"\(Status)","Location":"\(Location)","Cost":"\(Cost)","Notes":"\(Notes)"]
        
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/appointment/" + id) else {return}
        
        var request = URLRequest(url: _url)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions())
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("About to enter the -URLSession.shared.dataTask")
        URLSession.shared.dataTask(with:request) {
            (data, response, error) in
            
            
            guard let data = data, error == nil else {
                print("let data = data, error == nil else")
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print("let responseJSON = responseJSON as?")
                print("responseJSON: \(responseJSON)")
            }
            
            print("About to enter do -- catch block")
            do  {
                print(data)
                showAlert = true
                
                
                if data != data {
                    throw MyError.runtimeError("No data returned")
                }
                
            }
            catch {
                print("In the Do-Catch Error Block")
                let error = error
                print(error.localizedDescription)
            }
            
            
        }
        .resume()
        
        
    }
}
