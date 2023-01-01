//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shambhavi Jha on 31/12/22.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .padding(10)
            .foregroundColor(.white)
            .background(.blue)
    }
}

struct SubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.weight(.semibold))
            .padding(10)
            .foregroundColor(.white)
            .background(.green)
    }
}

struct Paragraph: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3.weight(.medium))
    }
}

extension View {
    func TitleStyle() -> some View {
        modifier(Title())
    }
    func SubTitleStyle() -> some View {
        modifier(SubTitle())
    }
    func ParagraphStyle() -> some View {
        modifier(Paragraph())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Hey, I'm Shambhavi :)")
                .TitleStyle()
            Text("I'm learning swiftUI")
                .SubTitleStyle()
            Text("I want to become an iOS developer")
                .ParagraphStyle()
            Text("Follow me along my journey!")
                .ParagraphStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
