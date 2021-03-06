//
//  StartView.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

struct StartView: View {
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        ZStack {
            
            // Set background color
            ColorMgr.mattered
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("Pump My Balloon").font(.custom("Digitalt", size: 45)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2).multilineTextAlignment(.center)
                //Text("Inflate the balloon!").font(.custom("Digitalt", size: 20)).foregroundColor(ColorMgr.dirtywhite).shadow(radius: 2)
                
                Spacer()
                
                Button(action: {
                    if(scale <= 2.4) {
                        self.scale += 0.05
                        print(scale)
                    }
                    
                        }) {
                            
                    Balloon()
                    .scaleEffect(scale)
                    .animation(Animation.easeOut(duration: 1))
                }
                
                Spacer()
                
                Button(action: navigateToContentView) {
                    HStack(alignment: .center) {
                        Text("Play").font(.custom("Digitalt", size: 26)).foregroundColor(ColorMgr.mattered)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 70)
                .foregroundColor(.blue)
                .font(.system(size: 14, weight: .bold))
                .background(ColorMgr.dirtywhite)
                .cornerRadius(5)
                .padding(.bottom, 10)
                    
                HStack {
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
