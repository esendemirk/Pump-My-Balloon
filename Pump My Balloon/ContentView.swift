//
//  ContentView.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1
    @State private var times: Int = 3
    @State private var level: Int = 1
    @State private var backgroundIndex: Int = 0
    @State private var balloonIndex: Int = 0
    @State private var showPopUp = false
    @State private var showGameOverPopUp = false
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore") // The current score that the user is on
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @State var timeRemaining = 10
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let colors = [ColorMgr.matteblue, ColorMgr.mattered, ColorMgr.matteorange, ColorMgr.matteyellow]
    
    var body: some View {

        ZStack {

            colors[backgroundIndex]
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        
                        Button(action: navigateToStartView) {
                            HStack(alignment: .center) {
                                Image(systemName: "house.fill").font(.system(size: 24)).foregroundColor(ColorMgr.dirtywhite)
                            }
                        }
                        
                        Button(action: navigateToScoreView) {
                            HStack(alignment: .center) {
                                Image(systemName: "chart.bar.fill").font(.system(size: 24)).foregroundColor(ColorMgr.dirtywhite)
                            }
                        }

                        Button(action: navigateToHowToView) {
                            HStack(alignment: .center) {
                                Image(systemName: "questionmark.circle.fill").font(.system(size: 24)).foregroundColor(ColorMgr.dirtywhite).padding(.trailing, 20)
                            }
                        }
                        
                    }
                }
                
                
                Spacer()
                
                Text("Balloon \(level)").font(Font.custom("Digitalt", size: 50)).foregroundColor(ColorMgr.dirtywhite)
                
                Text("\(times) more pumps").font(Font.custom("Digitalt", size: 20)).foregroundColor(ColorMgr.dirtywhite)
                
                Spacer()
                
                Button(action: {
                    if (times == 1) {
                        self.times -= 1
                        self.showPopUp = true
                        self.timer.upstream.connect().cancel()
                        self.feedback.notificationOccurred(.success)
                        //self.scale = 1
                        //self.level += 1
                        //self.times = Int.random(in: level..<level*3)
                        //self.backgroundIndex = Int(arc4random_uniform(UInt32(self.colors.count)))
                    } else {
                        if(times > 0) {
                            self.times -= 1
                            self.scale += 0.02
                            self.feedback.notificationOccurred(.success)
                            
                        }
                    }
                        }) {
                            
                    ZStack {
                        
                        Balloon()
                                .scaleEffect(scale)
                                .animation(Animation.easeOut(duration: 1))
                        Text("\(times)").font(Font.custom("Digitalt", size: 30*scale)).foregroundColor(colors[backgroundIndex])
                    }
                    
                    
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "stopwatch").font(Font.custom("Digitalt", size: 20))
                    Text("\(timeRemaining)").font(Font.custom("Digitalt", size: 36))
                        .onReceive(timer) { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                            }
                            if self.timeRemaining == 0 {
                                self.showGameOverPopUp = true
                            }
                        }
                }
                .foregroundColor(ColorMgr.dirtywhite)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )
                
                
                
                Spacer()
                
            }
            
            // Next level pop up
            if $showPopUp.wrappedValue {
                
                ZStack {
                    ColorMgr.dirtywhite
                    VStack {
                        Text("Great Job!").underline().font(Font.custom("Digitalt", size: 36)).foregroundColor(colors[backgroundIndex])
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 54)).foregroundColor(colors[backgroundIndex])
                        
                        Spacer()
                        
                        Button(action: {
                            self.showPopUp = false
                            
                            // Set the score to high score if higher than last
                            if self.level > self.highScore {
                                self.saveHighScore()
                                self.saveCurrentScore()
                            } else {
                                self.saveCurrentScore()
                            }
                            
                            // Play sound for tap feedback
                            playSound(sound: "pump", type: "mp3")
                            self.scale = 1
                            self.level += 1
                            self.times = Int.random(in: level..<level*3)
                            self.backgroundIndex = Int(arc4random_uniform(UInt32(self.colors.count)))
                            self.timeRemaining = 10
                            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }, label: {
                            Text("Next Level").font(Font.custom("Digitalt", size: 26)).foregroundColor(colors[backgroundIndex])
                            
                        })
                    }.padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(10).shadow(radius: 50)
            }
            
            // Game Over pop up
            if $showGameOverPopUp.wrappedValue {
                
                ZStack {
                    ColorMgr.dirtywhite
                    VStack {
                        Text("Game Over!").underline().font(Font.custom("Digitalt", size: 36)).foregroundColor(colors[backgroundIndex])
                        Spacer()
                        Image(systemName: "xmark.circle.fill").font(.system(size: 54)).foregroundColor(colors[backgroundIndex])
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.showGameOverPopUp = false
                            
                            // Set the score to high score if higher than last
                            if self.level > self.highScore {
                                self.saveHighScore()
                                self.saveCurrentScore()
                            } else {
                                self.saveCurrentScore()
                            }
                            
                            // Play sound for tap feedback
                            playSound(sound: "pump", type: "mp3")
                            self.scale = 1
                            self.level = 1
                            self.times = Int.random(in: level..<level*3)
                            self.backgroundIndex = Int(arc4random_uniform(UInt32(self.colors.count)))
                            self.timeRemaining = 10
                            self.timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
                        }, label: {
                            Text("Restart").font(Font.custom("Digitalt", size: 26)).foregroundColor(colors[backgroundIndex])
                            
                        })
                    }.padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(10).shadow(radius: 50)
            }
            
        }
        
    
    }
    
    
    func saveHighScore() {
        UserDefaults.standard.set(level, forKey: "highScore")
    }
    
    func saveCurrentScore() {
        UserDefaults.standard.set(level, forKey: "score")
    }
    
    
}


