import SwiftUI

struct NewAppointmentView : View {
    //@State var _arrAppData: [Appointment] = []
    
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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("New Appointments")
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
                
                Button("Add New Record") {
                    newAppointment()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .alert("New Record Added",isPresented: $showAlert) {
                    Button("Record added Successfully"){}
                }
                
                
            }//VStack
            
        }//ZStack
    }//var body
    
    enum MyError: Error {
        case runtimeError(String)
    }
    func newAppointment() {
        var body: [String: Any] = [:]
        
        body=["AppDate":"\(AppDate)","AppType":"\(AppType)","ContactPerson":"\(ContactPerson)","ContactPhone":"\(ContactPhone)","Status":"\(Status)","Location":"\(Location)","Cost":"\(Cost)","Notes":"\(Notes)"]
        
        
        print(body)
        
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/appointment/createAppointment/") else {return}
        
        var request = URLRequest(url: _url)
        request.httpMethod = "POST"
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
                //If you uncomment the line below, you will get an expected array but a dictionary was returned //instead
                //let apptData = try! JSONDecoder().decode(TDRootAppt.self, from: data)
                //print(apptData)
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


