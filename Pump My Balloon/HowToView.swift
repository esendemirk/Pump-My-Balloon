//
//  HowToView.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/14/20.
//

import SwiftUI

struct HowToView: View {
    
    var body: some View {
        
        ZStack {
            
            // Set background color
            ColorMgr.mattered
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("How To Play").font(.custom("Digitalt", size: 45)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2).multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Text("You have 10 seconds to inflate each balloon. As you progress, each balloon will require more pumps. If you fail to pump up the balloon with the specified number of pumps within the , you lose!").font(.custom("Digitalt", size: 20)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2).multilineTextAlignment(.center)
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
                    
                    // Button to navigate to high score screen
                    Button(action: navigateToScoreView) {
                        HStack(alignment: .center) {
                            Text("Score").font(.custom("Digitalt", size: 26)).foregroundColor(ColorMgr.mattered)
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
