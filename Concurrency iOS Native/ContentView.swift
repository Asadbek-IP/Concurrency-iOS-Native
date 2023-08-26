//
//  ContentView.swift
//  Concurrency iOS Native
//
//  Created by Mac Mini 1 on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var imagee1 = ""
    @State var imagee2 = ""
    @State var imagee3 = ""
   
    var thumbnail: String {
        get async {
            try? await Task.sleep(nanoseconds: 3 * 1000000000)
            return "my Thumbnail"
        }
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(imagee1) \(imagee2) \(imagee3)")
        }
        .padding()
        .onAppear{
//            let myTask = Task(priority: .background){
//                let image = await cancelTaskImage(name: "image1")
//                print(image)
//            }
//            
//            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false){ time in
//                
//                print("The time is up ")
//                myTask.cancel()
//                
//            }
            
//            let image = Task(priority: .background){
//                let im = await getTwoTask(name: "Image")
//                print(im)
//            }
            
            Task(priority: .background){
                let result = await thumbnail
                print(result)
            }
            
        }
//        .task(priority: .background) {
//            imagee1 = await loadImage(name: "Mega1")
//            imagee2 = await loadImage(name: "Mega2")
//            imagee3 = await loadImage(name: "Mega3")
//            
//        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        return "Name: \(name)"
    }
    
    
    func cancelTaskImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 5 * 1000000000)
        
        if !Task.isCancelled {
            return "Name: \(name)"
        }else{
            return "Task Cancelled"
        }
        
        
    }
    
    func getTwoTask(name: String) async -> String {
        let result = Task(priority: .background){ () -> String in
            let imageData = await getMetaData()
            return "Name \(name) Size \(imageData)"
        }
        
        let res = await result.value
        return res
    }
    
    
    
    func getMetaData() async -> Int {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        
        return 50000
    }
}

#Preview {
    ContentView()
}
