//
//  ContentView.swift
//  FluidGrids2
//
//  Created by chunlei on 7/8/2024.
//

import SwiftUI
import SwiftData
import Flow


struct ContentView: View {

    let systemIcons = ["star", "heart", "bell", "bookmark", "flag", "flame", "bolt", "leaf", "moon", "sun.max"]

    var body: some View {
        
        HFlow {
            ForEach(0...20, id: \.description) { index in
                let txt = generateRandomString(length: Int.random(in: 3...8))
                let randomIcon = systemIcons.randomElement()!

                Capsule()
                    .overlay(                    
                        HStack {
                            Image(systemName: randomIcon)
                            .foregroundColor(.white)
                        Text(txt)
                            .foregroundColor(.white)
                    })
                    .foregroundColor(index < 7 ? .red : index < 14 ? .orange : .gray)
                    .frame(height: 30)
                    .frame(width: calculateTextWidth(text: txt, font: .systemFont(ofSize: 18), height: 10))
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! }) + "(1)"
    }
    
    func calculateTextWidth(text: String, font: UIFont, height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width) + 35 // Adding  padding
    }
}



#Preview {
    ContentView()
}
