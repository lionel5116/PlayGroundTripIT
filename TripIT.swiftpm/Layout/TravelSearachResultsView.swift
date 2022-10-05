
import SwiftUI

struct TravelSearachResultsView: View {
    
    @State var arrTDdata: [TravelDetailHistory]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(arrTDdata, id: \._id) {
                    TDItem in
                    
                    NavigationLink {
                        TravelDetailEditView(itemToEdit: TDItem)
                    } label: {
                        Text(TDItem.BookingCode)
                            .foregroundColor(.green)
                    }
                    
                    Text(TDItem.Status)
                    Text(TDItem.Destination)
                    Text(TDItem.Airline)
                    Text(TDItem.TravelDate)
                    Text(TDItem.Year)
                    Text(String(TDItem.TotalCost!))
                    
                }
            }///List
            
        }//VStack
    }
    
}



