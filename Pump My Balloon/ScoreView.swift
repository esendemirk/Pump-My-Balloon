//
//  ScoreView.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/14/20.
//

import SwiftUI

struct ScoreView: View {
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore")
    
    var body: some View {
        
        ZStack {
            
            // Set background color
            ColorMgr.mattered
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("High Score").font(.custom("Digitalt", size: 45)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2).multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Text("\(highScore)").font(.custom("Digitalt", size: 60)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2)
                    Text("Balloons").font(.custom("Digitalt", size: 40)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2)
                }
                
                Spacer()
                
                
                Spacer()
                    
                HStack {
                    // Button to navigate to high score screen
                    Button(action: navigateToStartView) {
                        HStack(alignment: .center) {
                            Text("Home").font(.custom("Digitalt", size: 26)).foregroundColor(ColorMgr.mattered)
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(ColorMgr.dirtywhite)
                    .cornerRadius(5)
                    
                    // Button to navigate to how to play screen
                    Button(action: navigateToHowToView) {
                        HStack(alignment: .center) {
                            Text("How To").font(.custom("Digitalt", size: 26)).foregroundColor(ColorMgr.mattered)
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(ColorMgr.dirtywhite)
                    .cornerRadius(5)
                }

                Spacer()
                
            }.padding(.horizontal, 50)
        }
        
        
    }
}
