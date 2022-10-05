
import SwiftUI

struct AppointmentSearchResultsView: View {
    
    @State var arrAppData: [Appointment]
    @State private var isPresented: Bool = false;
    
    var body: some View {
        
        VStack {
            List {
                ForEach(arrAppData, id: \._id) {
                    appItem in
                    
                    NavigationLink {
                        AppointmentEditView(itemToEdit: appItem)
                    } label: {
                        Text(appItem.AppDate)
                            .foregroundColor(.green)
                    }
                    
                    Text("Location: \(appItem.Location) - Status: \(appItem.Status)")
                        .foregroundColor(appItem.Status == "Complete" ? .green : .red)
                        .bold()
                    Text(appItem.ContactPerson)
                    Text(appItem.ContactPhone)
                    Text(appItem.AppDate)
                    Text(String(appItem.Cost!))
                    
                }
            }///List
        }//VStack
        .sheet(isPresented: $isPresented, content: {
            
            NewAppointmentView()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label : {
                    Image(systemName: "plus")
                } //label
            }
        }//toolbar
    }
    
}





