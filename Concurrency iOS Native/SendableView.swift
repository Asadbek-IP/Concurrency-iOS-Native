//
//  SendableView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 26/08/23.
//

import SwiftUI

final class Product: @unchecked Sendable{
    let name: String
    init(name: String) {
        self.name = name
    }
}

actor ItemDate2{
    var stock: Int = 100
    
    func sellProduct(product: Product, quantity: Int){
        stock = stock - quantity
        print("Stock \(stock) \(product.name) ")
    }
}
struct SendableView: View {
    var itemData: ItemDate2 = ItemDate2()
    var body: some View {
        Button("Start progress"){
            Task(priority: .background){
                let product = Product(name: "iPhone")
                
                await itemData.sellProduct(product: product, quantity: 5)
            }
        }
    }
}

#Preview {
    SendableView()
}
