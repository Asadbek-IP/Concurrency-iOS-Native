//
//  MainActorView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 26/08/23.
//

import SwiftUI

struct MainActorView: View {
    @State private var mytext: String = "Hello world"
    var body: some View {
        VStack{
            Text(mytext)
        }
        .onAppear{
            Task(priority: .background){
              await loadText(name:"newText")
            }
        }
        
        
    }
    
    @MainActor func loadText(name: String) async {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        mytext = name
    }
}

#Preview {
    MainActorView()
}
