//
//  Balloon.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

struct Balloon: View {
    var body: some View {
        
        VStack(spacing: 0) {
            Circle().fill(ColorMgr.dirtywhite)
                .frame(width: 100, height: 100)
            Triangle().fill(ColorMgr.dirtywhite)
                .frame(width: 15, height: 8).offset(y: -3)
        }
        
    }
}

public struct Triangle: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }

}
