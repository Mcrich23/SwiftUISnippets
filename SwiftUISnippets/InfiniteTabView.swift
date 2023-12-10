//
//  InfiniteTabView.swift
//  SwiftUISnippets
//
//  Created by Morris Richman on 12/10/23.
//

import SwiftUI

struct InfiniteTabView: View {
    let elements = ["0", "1", "2", "3", "4", "5"]
    @State var index = 1
    @State var backElement: String? = "2"
    @State var centerElement: String = "3"
    @State var centerElementIndex = 3
    @State var forwardElement: String? = "4"
    
    var body: some View {
        TabView(selection: $index) {
            if let backElement {
                Text(backElement)
                    .tag(0)
            }
            Text(centerElement)
                .tag(1)
            if let forwardElement {
                Text(forwardElement)
                    .tag(2)
            }
        }
        .tabViewStyle(.page)
        .onChange(of: index) { oldValue, newValue in
            guard newValue != 1 else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(140)) {
                if newValue == 2 {
                    if (elements.count - 1) >= (centerElementIndex + 1) {
                        centerElementIndex += 1
                        centerElement = elements[centerElementIndex]
                        
                        if centerElementIndex > 0 {
                            backElement = elements[centerElementIndex-1]
                        } else {
                            backElement = nil
                        }
                        
                        if (elements.count - 1) >= (centerElementIndex + 1) {
                            forwardElement = elements[centerElementIndex+1]
                        } else {
                            forwardElement = nil
                        }
                    }
                } else if newValue == 0 {
                    if centerElementIndex > 0 {
                        centerElementIndex -= 1
                        centerElement = elements[centerElementIndex]
                        
                        if centerElementIndex > 0 {
                            backElement = elements[centerElementIndex-1]
                        } else {
                            backElement = nil
                        }
                        
                        if (elements.count - 1) >= (centerElementIndex + 1) {
                            forwardElement = elements[centerElementIndex+1]
                        } else {
                            forwardElement = nil
                        }
                    }
                }
                index = 1
            }
        }
    }
}

#Preview {
    InfiniteTabView()
}
