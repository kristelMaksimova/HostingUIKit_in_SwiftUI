//
//  ContentView.swift
//  HostingUIKit_in_SwiftUI
//
//  Created by Kristel Maximova on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Int.random(in: 0...100)
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding()
            
            HStack {
                Text("0")
                SliderChangeView(currentValue: $currentValue, opacity: computeScore())
                Text("100")
            }
            .padding()
            
            ButtonView(title: "Проверь меня!",
                       action: {alertPresented.toggle()}
            )
                .alert("Your Score", isPresented: $alertPresented, actions: {}) {
                    Text(String(computeScore()))
                }
                .padding()
            
            ButtonView(title: "Начать заново",
                       action: {targetValue = Int.random(in: 0...100)}
            )
        }
    }
    
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
