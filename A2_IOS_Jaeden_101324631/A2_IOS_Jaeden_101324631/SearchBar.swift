//Jaeden Salandanan
//101324631
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
   
    var body: some View {
        TextField("Search", text: $text)
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding([.top, .horizontal])
    }
}


