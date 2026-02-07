//  ContainerView.swift
//  HIITFit
//  Created by Loi Ton on 2/6/26.

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color("background"))
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundStyle(Color("background"))
            }
            content
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            VStack {
                RaisedButton(buttonText: "Hello World") {}
                    .padding(50)
                Button("Tap me!") {}
                    .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
            }
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
    }
}
