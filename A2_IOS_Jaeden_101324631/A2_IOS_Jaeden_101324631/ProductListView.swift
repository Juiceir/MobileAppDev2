//Jaeden Salandanan
//101324631

import SwiftUI

struct ProductListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productName, ascending: true)]
    ) private var products: FetchedResults<Product>

    @State private var searchText = ""

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return Array(products)
        } else {
            return products.filter {
                ($0.productName?.lowercased().contains(searchText.lowercased()) ?? false) ||
                ($0.productDescription?.lowercased().contains(searchText.lowercased()) ?? false)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(filteredProducts, id: \.self) { product in
                    VStack(alignment: .leading) {
                        Text(product.productName ?? "No name")
                            .font(.headline)
                        Text(product.productDescription ?? "No description")
                            .font(.subheadline)
                        Text("Product ID: \(product.productID)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(product.productProvider ?? "No Provider")
                            .font(.caption)
                            .foregroundColor(.gray)
                        if let price = product.productPrice{
                            Text("Price: \(price.stringValue)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Products")
                .navigationBarItems(trailing: NavigationLink(destination: AddProductView()) {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
