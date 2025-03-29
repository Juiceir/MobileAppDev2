import SwiftUI

struct ContentView: View {
    @State private var output: Int = 0
    @State private var step: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("gbclogo")
                .resizable()  
                .aspectRatio(contentMode: .fit)  
                .frame(width: 150, height: 150)  
                .padding()
            
            Text("\(output)")
                .font(.system(size: 50, weight: .bold))
                .frame(width: 200, height: 100)
                .border(Color.black, width: 2)
                .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    output += step
                }) {
                    Text("+")
                        .frame(width: 100, height: 50)
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    output -= step
                }) {
                    Text("-")
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            
            Button(action: {
                output = 0
            }) {
                Text("Reset")
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Button(action: {
                step = (step == 1) ? 2 : 1
            }) {
                Text("Step: \(step)")
                    .frame(width: 220, height: 50)
                    .background(Color.purple)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
        }
        .padding()
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
