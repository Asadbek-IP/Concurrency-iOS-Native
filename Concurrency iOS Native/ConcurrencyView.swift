//
//  ConcurrencyView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 26/08/23.
//

import SwiftUI

struct ConcurrencyView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear{
            let currentTime = Date()
            Task(priority: .background){
                async let image1 = loadImage(name: "image1")
                async let image2 = loadImage(name: "image2")
                async let image3 = loadImage(name: "image3")
                
                let listNames = await "\(image1), \(image2) and \(image3)"
                
                print("List names: \(listNames)")
                print("Total times: \(Date().timeIntervalSince(currentTime))")
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3*1000000000)
        return "Name: \(name)"
    }
}

#Preview {
    ConcurrencyView()
}
