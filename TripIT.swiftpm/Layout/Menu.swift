
import SwiftUI

struct Menu: View {
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack{
                CommonNavigationLink(destination: SearchTravelView(), btnTitle: "Search Travel",
                                     btnWidth: 280,
                                     btnHeight: 50,
                                     fontWeight: .bold,
                                     foregroundColor: .white,
                                     backgroundColor: Color.blue,
                                     conrnerRadius: 30,
                                     font: .system(size:20,design: .default))
                
                CommonNavigationLink(destination: NewAppointmentView(), btnTitle: "New Appointment",
                                     btnWidth: 280,
                                     btnHeight: 50,
                                     fontWeight: .bold,
                                     foregroundColor: .white,
                                     backgroundColor: Color.blue,
                                     conrnerRadius: 30,
                                     font: .system(size:20,design: .default))
                
                
                CommonNavigationLink(destination: SearchAppointments(), btnTitle: "Search Appointments",
                                     btnWidth: 280,
                                     btnHeight: 50,
                                     fontWeight: .bold,
                                     foregroundColor: .white,
                                     backgroundColor: Color.blue,
                                     conrnerRadius: 30,
                                     font: .system(size:20,design: .default))
                
                
                CommonNavigationLink(destination: ContentView(), btnTitle: "Main",
                                     btnWidth: 280,
                                     btnHeight: 50,
                                     fontWeight: .bold,
                                     foregroundColor: .white,
                                     backgroundColor: Color.gray,
                                     conrnerRadius: 30,
                                     font: .system(size:20,design: .default))
                
                
            } //VStack
        } //ZStack
        
        .navigationBarHidden(true)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

