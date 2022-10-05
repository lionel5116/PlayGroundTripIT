import SwiftUI

struct ReusableTextControl: View {
    var title: String
    @Binding var _Text: String
    var backgroundColor: Color
    var frameWidth: CGFloat
    var frameHeight: CGFloat
    var cornerRadius: CGFloat
    var _borderColor: UIColor
    
    var body: some View {
        TextField(title,text: $_Text)
            .padding()
            .background(backgroundColor)
            .frame(width: frameWidth, height: frameHeight)
            .cornerRadius(cornerRadius)
            .border(Color(uiColor: _borderColor))
    }
}
