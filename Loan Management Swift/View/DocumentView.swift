//
//  DocumentView.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

import SwiftUI

struct DocumentView: View {
    
    let url: String
    
    @State var scale = 1.0
    @State var lastScale = 1.0
    @State var offset: CGSize = .zero
    @State var lastOffset: CGSize = .zero
    private let minScale: CGFloat = 1.0
    private let maxScale: CGFloat = 5.0
    
    var magnification : some Gesture{
        MagnificationGesture()
            .onChanged { state in
               adjustScale(from: state)
            }
            .onEnded { state in
                lastScale = 1.0
                validateScaleLimits()
            }
    }
    
    func adjustScale(from state: MagnificationGesture.Value){
        let delta = state / lastScale
        scale *= delta
        lastScale = state
    }
    
    func getMinimumScaleAllowed() -> CGFloat{
        return max(scale, minScale)
    }
    
    func getMaximumScaleAlllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleLimits(){
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAlllowed()
    }
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0)
            .onChanged({ value in
                withAnimation(.interactiveSpring()) {
                    offset = handleOffsetChange(value.translation)
                }
            })
            .onEnded({ _ in
                lastOffset = offset
            })
    }
    
    
    private func handleOffsetChange(_ offset: CGSize) -> CGSize {
        var newOffset: CGSize = .zero
        
        newOffset.width = offset.width + lastOffset.width
        newOffset.height = offset.height + lastOffset.height
        
        return newOffset
    }
    
    
    var body: some View {
        GeometryReader{ geometry in
            AsyncImage(url: URL(string: API.baseUrl.rawValue + url)){ phase in
                switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .offset(offset)
                            .gesture(magnification.simultaneously(with: dragGesture))
                    case .failure(_):
                        Image(systemName: "ant.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.5)
                            .foregroundColor(.teal)
                            .opacity(0.6)
                    case .empty:
                        Image(systemName: "photo.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.5)
                            .foregroundColor(.teal)
                            .opacity(0.6)
                    @unknown default:
                        ProgressView()
                }
            }
        }
        
    }
}
