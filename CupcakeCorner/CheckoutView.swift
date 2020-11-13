//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Amber Spadafora on 11/13/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: ObservableOrder
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text("Your total cost is $\(self.order.order.cost, specifier: "%.2f")").font(.title)
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }.navigationBarTitle("Check out", displayMode: .inline)
            .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Thank You!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }

    func placeOrder(){
        guard let encoded = try? JSONEncoder().encode(order.order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response :\(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way!"
                self.showingConfirmation = true
            }
            
        }.resume()
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: ObservableOrder(order: Order()))
    }
}
