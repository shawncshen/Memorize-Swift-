//
//  ContentView.swift
//  Memorize
//
//  Created by Shawn Shen on 10/18/25.
//

import SwiftUI // dont always import swift UI because we separte backend from frontend.

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃","🕷️", "😈", "💀", "🕸️", "🧙‍♂️", "🙀", "😈", "😱", "☠️", "🍭"] //Array<String> = [String] same thing
    
    @State var cardCount: Int = 4

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .foregroundColor(.orange)
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            cardAdder
        }
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
        

    
    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
