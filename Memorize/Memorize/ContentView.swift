//
//  ContentView.swift
//  Memorize
//
//  Created by Shawn Shen on 10/18/25.
//

import SwiftUI // dont always import swift UI because we separte backend from frontend.

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()i 
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack (content: {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
                
        })
    }
}

#Preview {
    ContentView()
        .previewLayout(.sizeThatFits)
        .padding()
}
