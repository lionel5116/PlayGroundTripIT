import SwiftUI

struct SearchAppointments: View {
    @State var _arrAppData: [Appointment] = []
    private let AppType: [String] = [
        "Tour",
        "Session",
        "Meeting",
        "FTPower"
    ]
    
    private let Status: [String] = [
        "Pending",
        "Booked",
        "Complete",
    ]
    
    private let searchTypes: [String] = [
        "id",
        "All",
        "AppType",
        "Status",
        "ContactPerson"
    ]
    
    @State private var searchType: String = ""
    @State private var selectedStatus: String = ""
    @State private var selectedAppType: String = ""
    @State private var ContactPerson = ""
    @State private var showAppontmentResultsView = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Group {
                    Text("Selected: \(searchType)")
                    Picker("Select a Search Type",
                           selection:$searchType) {
                        ForEach(searchTypes, id: \.self) {
                            sType in
                            Text(sType)
                        }
                    }.pickerStyle(.wheel)
                        .padding()
                    
                    Text("Status: \(selectedStatus)")
                    Picker("Select a Status",
                           selection:$selectedStatus) {
                        ForEach(Status, id: \.self) {
                            stat in
                            Text(stat)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    
                    Text("Appointment Type: \(selectedAppType)")
                    Picker("Select Appointment /type",
                           selection:$selectedAppType) {
                        ForEach(AppType, id: \.self) {
                            appt in
                            Text(appt)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    
                    TextField("Contact Person", text: $ContactPerson)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }//Group
                Spacer()
                Button("Search") {
                    if(searchType != "" ){
                        searchAppointments()
                    }
                    else {
                        print("You need to have a search type selected!!!!1")
                    }
                    
                }.foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                
                NavigationLink(destination: AppointmentSearchResultsView(arrAppData: _arrAppData),isActive: $showAppontmentResultsView) {
                    EmptyView();
                }
                
            }.background(.black)//VStack
            
        }//ZStack
    }//View
    
    enum MyError: Error {
        case runtimeError(String)
    }
    
    func searchAppointments() {
        var body: [String: Any] = [:]
        
        switch searchType {
            case "AppType":
            body=["id":"","AppType":"\(selectedAppType)","Status":"","ContactPerson":"","SearchType":"AppType"]
            print(body)
            
        case "Status":
            body=["id":"","AppType":"","Status":"\(selectedStatus)","ContactPerson":"","SearchType":"Status"]
            print(body)
            
        case "ContactPerson":
            body=["id":"","AppType":"","Status":"\(selectedStatus)","ContactPerson":"","SearchType":"ContactPerson"]
            print(body)
            
        case "All":
            body=["id":"","AppType":"","Status":"","ContactPerson":"","SearchType":"All"]
            print(body)
        default:
            print("Nothing Selected")
        }
        
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/appointment/searchAppointment") else {return}
        
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
                
                let apptData = try! JSONDecoder().decode(TDRootAppt.self, from: data)
                let tdApptItems = apptData.appointment
                
                var oAppDetails: Appointment
                _arrAppData = []
                
                for tdAppmtItem in tdApptItems {
                    
                    oAppDetails = Appointment(
                        _id:tdAppmtItem._id,
                        AppType: tdAppmtItem.AppType,
                        AppDate: tdAppmtItem.AppDate,
                        ContactPerson: tdAppmtItem.ContactPerson,
                        ContactPhone: tdAppmtItem.ContactPhone,
                        Status: tdAppmtItem.Status,
                        Location: tdAppmtItem.Location,
                        Cost: tdAppmtItem.Cost  != nil ? tdAppmtItem.Cost : 0.0,
                        Notes: tdAppmtItem.Notes)
                    
                    _arrAppData.append(oAppDetails)
                    
                }
                if _arrAppData.count > 0 {
                    //print(_arrAppData)
                    showAppontmentResultsView = true //activate navigation
                }
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

