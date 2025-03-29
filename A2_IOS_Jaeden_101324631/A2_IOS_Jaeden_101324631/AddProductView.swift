//Jaeden Salandanan
//101324631
import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode

    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productProvider = ""

    var body: some View {
        Form {
            Section(header: Text("Product Details")) {
                TextField("Name", text: $productName)
                TextField("Description", text: $productDescription)
                TextField("Price", text: $productPrice)
                    .keyboardType(.decimalPad)
                TextField("Provider", text: $productProvider)
            }

            Button(action: saveProduct) {
                Text("Save Product")
            }
        }
        .navigationTitle("Add Product")
    }

    private func saveProduct() {
        let price = Double(productPrice) ?? 0.0
        let decimalPrice = NSDecimalNumber(value: price)
        
        let newProduct = Product(context: viewContext)
        newProduct.productName = productName
        newProduct.productDescription = productDescription
        newProduct.productPrice = decimalPrice
        newProduct.productProvider = productProvider
        newProduct.productID = Int64.random(in: 1...1000)

        do {
            try viewContext.save()
            
            productName=""
            productPrice=""
            productDescription=""
            productProvider=""
            
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error saving product: \(error)")
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

