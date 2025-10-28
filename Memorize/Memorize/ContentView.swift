//
//  ContentView.swift
//  Memorize
//
//  Created by Shawn Shen on 10/18/25.
//

import SwiftUI // dont always import swift UI because we separte backend from frontend.

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃","🕷️", "😈"] //Array<String> = [String] same thing

    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
        .padding()
}
