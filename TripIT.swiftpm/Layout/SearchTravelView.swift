
import SwiftUI

struct SearchTravelView: View {
    
    @State var _arrTDdata: [TravelDetailHistory] = []
    
    private let airlines: [String] = [
        "American",
        "Spirit",
        "United",
        "Copa",
        "Jet Blue",
        "Viva"
    ]
    
    private let searchTypes: [String] = [
        "All",
        "Airline",
        "Year"
    ]
    
    @State private var year: String = ""
    @State private var selectedAirline: String  = ""
    @State private var searchType: String  = ""
    
    @State private var showTravelSearchResultsView = false
    
    
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                
                Group {
                    Text("Selected: \(searchType)")
                    Picker("Select a Search Type",
                           selection: $searchType) {
                        ForEach(searchTypes, id: \.self) {
                            sType in
                            Text(sType)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                        
                        
                    
                    
                    Text("Airline: \(selectedAirline)")
                    Picker("Select an Airline",
                           selection: $selectedAirline) {
                        ForEach(airlines, id: \.self) {
                            _airline in
                            Text(_airline)
                        }
                    }.pickerStyle(.wheel)
                    TextField("Year", text: $year)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color(uiColor: .blue))
                }//Group
                Spacer()
                Button("Search") {
                    searchTravel()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                
                NavigationLink(destination: TravelSearachResultsView(arrTDdata: _arrTDdata),isActive: $showTravelSearchResultsView) {
                    EmptyView();
                }
                
            }.background(.black) //VStack
        }
        
    }
    
    enum MyError: Error{
        case runtimeError(String)
    }
    
    func searchTravel() {
        var body: [String: Any]  = [:]
        
        switch searchType {
        case "Airline":
            body = ["BookingCode": "","Airline": "\(selectedAirline)","APCode": "","Status": "","Year": "","SearchType": "Airline"]
            print(body)
        case "Year":
            body = ["BookingCode": "","Airline": "Spirit","APCode": "","Status": "","Year": "\(year)","SearchType": "Year"]
            print(body)
        default:
            print("Nothing selected")
        }
        //return
        
        //body = ["BookingCode": "","Airline": "Spirit","APCode": "","Status": "","Year": "","SearchType": "Airline"]
        
        
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/travel/searchTravelRecord") else {return}
        //guard let _url = URL(string:"http://localhost:5001/api/travel/searchTravelRecordJSON") else {return}
        
        
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
                
                let travelData = try! JSONDecoder().decode(TDRoot.self, from: data)
                
                let tdHistoryItems = travelData.travel
                
                var oDetails: TravelDetailHistory
                _arrTDdata = []
                for tdHistItem in tdHistoryItems {
                    oDetails = TravelDetailHistory(
                        _id:tdHistItem._id,
                        Destination: tdHistItem.Destination,
                        Year: tdHistItem.Year,
                        TravelDate: tdHistItem.TravelDate,
                        Airline: tdHistItem.Airline,
                        Hotel: tdHistItem.Hotel,
                        BookingCode: tdHistItem.BookingCode,
                        APCode: tdHistItem.APCode,
                        ItineraryFlght: tdHistItem.ItineraryFlght,
                        ItineraryHotel: tdHistItem.ItineraryHotel,
                        Status: tdHistItem.Status,
                        FlightCost: tdHistItem.FlightCost != nil ? tdHistItem.FlightCost : 0.0,
                        HotelCost: tdHistItem.HotelCost != nil ? tdHistItem.HotelCost : 0.0,
                        GirlCost: tdHistItem.GirlCost != nil ? tdHistItem.GirlCost : 0.0,
                        TotalCost: tdHistItem.TotalCost  != nil ? tdHistItem.TotalCost : 0.0,
                        Rating: tdHistItem.Rating,
                        Notes: tdHistItem.Notes)
                    
                    _arrTDdata.append(oDetails)
                    
                }
                if _arrTDdata.count > 0 {
                    showTravelSearchResultsView = true //activate navigation
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

struct SearchTravelView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchTravelView()
        }
    }
}

