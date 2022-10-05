
import SwiftUI
import Combine
import Foundation


struct  CommonReusableButton: View {
    
    var btnTitle: String
    var frameWidth: CGFloat
    var frameHeight: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var conrnerRadius: CGFloat
    
    
    init(
         btnTitle:String,
         frameWidth:CGFloat,
         frameHeight:CGFloat,
         foregroundColor:Color = .white,
         backgroundColor:Color = .green,
         conrnerRadius:CGFloat = 10
         
         
    )
    {
        
        self.btnTitle = btnTitle
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.conrnerRadius = conrnerRadius
        
        
    }
    
    
    var body: some View {
        
            Button(btnTitle) {
            }
                .foregroundColor(foregroundColor)
                .frame(width: frameWidth, height: frameHeight)
                .background(backgroundColor)
                .cornerRadius(conrnerRadius)
                
    }
}







