//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Yüksel Toprak on 24.01.22.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        
        
        //Lesson Card
        
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack {
                
                Text(String(index + 1))
                    .bold()
                    .padding()
                    
                   
                VStack(alignment: .leading, spacing: 7) {
                    Text(lesson.title)
                        .font(.headline)
                    Text(lesson.duration)
                        .font(.subheadline)
                }
               
               
            }
          
        }
        .padding(.bottom, 7)
    }
}

