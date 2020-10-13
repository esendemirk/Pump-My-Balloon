//
//  ContentView.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1
    @State private var times: Int = 50
    @State private var level: Int = 1
    @State private var backgroundIndex: Int = 0
    @State private var balloonIndex: Int = 0
    
    let colors = [ColorMgr.matteblue, ColorMgr.mattered, ColorMgr.matteorange, ColorMgr.matteyellow]
    
    var body: some View {
        
        ZStack {
            colors[backgroundIndex]
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("LEVEL \(level)").font(Font.custom("Digitalt", size: 50)).foregroundColor(ColorMgr.dirtywhite)
                
                Text("PUMP IT \(times) TIMES").font(Font.custom("Digitalt", size: 20)).foregroundColor(ColorMgr.dirtywhite)
                
                Spacer()
                
                Button(action: {
                    self.scale += 0.02
                    self.times -= 1
                    if (times == 0) {
                        // Play sound for tap feedback
                        playSound(sound: "tap", type: "mp3")
                        print("next level")
                        self.scale = 1
                        self.level += 1
                        self.times = Int.random(in: 1..<level)
                        self.backgroundIndex = Int(arc4random_uniform(UInt32(self.colors.count)))
                    }
                        }) {
                            //Text("PUMP MY BALLOON").font(Font.custom("Digitalt", size: 20))
                            
                            Balloon()
                            .scaleEffect(scale)
                            .animation(Animation.easeOut(duration: 1))
                        }
                Spacer()
                
            }
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
