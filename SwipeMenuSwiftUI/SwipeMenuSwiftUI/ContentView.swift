//
//  ContentView.swift
//  SwipeMenuSwiftUI
//
//  Created by Nelson Gonzalez on 12/28/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     
     // increase size until ur satisfaction
     @State var size : CGFloat = UIScreen.main.bounds.height - 130
     
     var body: some View {
         
         
         ZStack{
             
             Color.orange
             
             Swipe().cornerRadius(20).padding(15).offset(y: size)
             .gesture(DragGesture()
                 .onChanged({ (value) in
                     
                     if value.translation.height > 0{
                         
                         self.size = value.translation.height
                     }
                     else{
                         
                         let temp = UIScreen.main.bounds.height - 130
                         self.size = temp + value.translation.height
                         
                         // in up wards value will be negative so we subtracting the value one by one from bottom
                     }
                 })
                 .onEnded({ (value) in
                     
                     if value.translation.height > 0{
                         
                         if value.translation.height > 200{
                             
                             self.size = UIScreen.main.bounds.height - 130
                         }
                         else{
                             
                             self.size = 15
                         }
                     }
                     else{
                         
                         //since in negative lower value will be greater...
                         
                         if value.translation.height < -200{
                                                  
                             self.size = 15
                         }
                         else{
                                                  
                             self.size = UIScreen.main.bounds.height - 130
                         }
                     }
                     
                 })).animation(.spring())
             
             // animation for drag
         }
     }
 }
 
 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 
 struct Swipe: View {
     
     var body : some View{
         
         VStack{
             
             // for pushing view up / down
             VStack{
                 
                 //top + bottom 30 so aprox height - 100
                 Text("Swipe up to See More").fontWeight(.heavy).padding([.top,.bottom],15)
             }
            
             
             // your custom view here....
             HStack{
                 
                 Spacer()
                 Text("hello top").fontWeight(.heavy).padding()
             }
             
             Spacer()
             Text("hello bottom").fontWeight(.heavy).padding()
         }.background(Color.white)
     }
 }
