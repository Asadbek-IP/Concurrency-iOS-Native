//
//  ErrorView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 26/08/23.
//

import SwiftUI
enum MyError: Error {
    case noDate, noImage
}
struct ErrorView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear{
            Task(priority: .background){
                do{
                    let image = await try loadImage(name: "image1")
                }
                catch MyError.noImage{
                    print("No image")
                }
                
                catch MyError.noDate {
                    print("NO data")
                }
            }
        }
    }
    
    
    
    func loadImage(name: String) async throws -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        
        var isError = true
        
        if isError {
            throw MyError.noImage
        }
        
        return "Name: \(name)"
    }
}

#Preview {
    ErrorView()
}
