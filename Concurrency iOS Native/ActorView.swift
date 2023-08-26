//
//  ActorView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 26/08/23.
//

import SwiftUI

actor ItemData {
    var counter: Int = 0
    
    func increment() -> String{
        counter = counter + 1
        return "Value: \(counter)"
        
    }
}

struct ActorView: View {
    let itemData = ItemData()
    var body: some View {
        Button("Start progress"){
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ (time) in
                Task(priority: .background){
                    async let value = itemData.increment()
                    print(await value)
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true){ (time) in
                
                Task(priority: .high){
                    async let value = itemData.increment()
                    print(await value)
                }
                
            }
            
        }
    }
}

#Preview {
    ActorView()
}
