
import SwiftUI
import Combine
import Foundation

struct CommonNavigationLink<T:View>: View {
    var destination: T
    var btnTitle: String
    var btnWidth: CGFloat
    var btnHeight: CGFloat
    var fontWeight: Font.Weight
    var foregroundColor: Color
    var backgroundColor: Color
    var conrnerRadius: CGFloat
    var font: Font
    //.font(.system(size:20,weight: .bold,design: .default))
    
    init(destination:T,
         btnTitle:String,
         btnWidth:CGFloat,
         btnHeight:CGFloat,
         fontWeight:Font.Weight = .semibold,
         foregroundColor:Color = .white,
         backgroundColor:Color = Color.init(red: 22/255, green: 70/255, blue: 190/255),
         conrnerRadius:CGFloat = 30,
         font: Font
         
    )
    {
        self.destination = destination
        self.btnTitle = btnTitle
        self.btnWidth = btnWidth
        self.btnHeight = btnHeight
        self.fontWeight = fontWeight
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.conrnerRadius = conrnerRadius
        self.font = font
    }
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(btnTitle)
                .fontWeight(fontWeight)
                .foregroundColor(foregroundColor)
                .frame(width: btnWidth, height: btnHeight)
                .background(backgroundColor)
                .cornerRadius(conrnerRadius)
                .font(font)
            
        }
    }
}

struct CommonNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CommonNavigationLink(destination: Menu(),
                             btnTitle: "Log In",
                             btnWidth: 335,
                             btnHeight: 60,
                             fontWeight: .semibold,
                             foregroundColor: .white,
                             backgroundColor: Color.init(red: 22/255, green: 70/255, blue: 190/255),
                             conrnerRadius: 30,
                             font: .system(size:20,design: .default))
        
    }
    
}



