import SwiftUI

struct TravelDetailEditView : View {
    var itemToEdit: TravelDetailHistory?
    @State private var showAlert = false
    
    @State private var  recID = ""
    @State private var  Destination = ""
    @State private var  Year = ""
    @State private var  TravelDate = ""
    @State private var  Airline = ""
    @State private var  Hotel = ""
    @State private var  BookingCode = ""
    @State private var  APCode = ""
    @State private var  ItineraryFlght = ""
    @State private var  ItineraryHotel = ""
    @State private var  Status = ""
    @State private var  FlightCost = ""
    @State private var  HotelCost = ""
    @State private var  GirlCost = ""
    @State private var  TotalCost = ""
    @State private var  Rating = ""
    @State private var  Notes = ""
    
    //dismiss the keyboard
    @Environment(\.dismiss) private var dismiss
    
    
    //init(appointmentItem:Appointment, itemToEdit:Appointment? = nil) {
    init( itemToEdit:TravelDetailHistory? = nil) {
        //self.init(appointmentItem: appointmentItem)
        self.itemToEdit = itemToEdit
        
        if let _itemToEdit = itemToEdit {
            _recID = State(initialValue: _itemToEdit._id)
            _Destination = State(initialValue: _itemToEdit.Destination)
            _Year = State(initialValue: _itemToEdit.Year)
            _TravelDate = State(initialValue: _itemToEdit.TravelDate)
            _Airline = State(initialValue: _itemToEdit.Airline)
            _Hotel = State(initialValue: _itemToEdit.Hotel)
            _BookingCode = State(initialValue: _itemToEdit.BookingCode)
            _APCode = State(initialValue: _itemToEdit.APCode)
            _ItineraryFlght = State(initialValue: _itemToEdit.ItineraryFlght)
            _ItineraryHotel = State(initialValue: _itemToEdit.ItineraryHotel)
            _Status = State(initialValue: _itemToEdit.Status)
            _FlightCost = State(initialValue: String(_itemToEdit.FlightCost!))
            _HotelCost = State(initialValue: String(_itemToEdit.HotelCost!))
            _GirlCost = State(initialValue: String(_itemToEdit.GirlCost!))
            _TotalCost = State(initialValue: String(_itemToEdit.TotalCost!))
            _Rating = State(initialValue: _itemToEdit.Rating)
            _Notes = State(initialValue: _itemToEdit.Notes)
            
        }
    }//init
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                Text("Travel Detail Record")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Group{
                    HStack() {
                        Text("Destination").frame(width:100,alignment: .leading)
                        TextField("Destination",text:$Destination)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 200)
                        .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                
                    HStack() {
                        Text("TravelDate").frame(width:100,alignment: .leading)
                        TextField("Travel Date",text:$TravelDate)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                
                    HStack() {
                        Text("Airline").frame(width:100,alignment: .leading)
                        TextField("Airline",text:$Airline)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                
                    HStack() {
                        Text("Hotel").frame(width:100,alignment: .leading)
                        TextField("Hotel",text:$Hotel)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                
                    HStack() {
                        Text("Booking Code").frame(width:100,alignment: .leading)
                        TextField("BookingCode",text:$BookingCode)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    HStack() {
                        Text("Status").frame(width:100,alignment: .leading)
                        TextField("Status",text:$Status)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                }
                    
                Group{
                    HStack() {
                        Text("Flight Cost").frame(width:100,alignment: .leading)
                        TextField("FlightCost",text:$FlightCost)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    HStack() {
                        Text("Hotel Cost").frame(width:100,alignment: .leading)
                        TextField("HotelCost",text:$HotelCost)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    HStack() {
                        Text("Session Cost").frame(width:100,alignment: .leading)
                        TextField("GirlCost",text:$GirlCost)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    HStack() {
                        Text("Total Cost").frame(width:100,alignment: .leading)
                        TextField("TotalCost",text:$TotalCost)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    HStack() {
                        Text("Rating").frame(width:100,alignment: .leading)
                        TextField("Rating",text:$Rating)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200)
                            .border(Color(uiColor: .blue))
                    }.padding(.horizontal,20)
                    
                    TextEditor(text: $Notes)
                        .padding()
                        .padding().frame(width: 300, height: 200)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color(uiColor: .blue))
                }
            }//VStack
        }//ZStack
    }
}

struct TravelDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        TravelDetailEditView()
    }
}
