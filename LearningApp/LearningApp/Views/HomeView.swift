//
//  ContentView.swift
//  LearningApp
//
//  Created by Yüksel Toprak on 23.01.22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.horizontal, 17)
                
                ScrollView {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(model.modules) { module in
                            
                          
                            
                            NavigationLink(
                                destination:
                                    ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                label: {
                                    //Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn\(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                            
                            
                            
                            //Test Card
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                        }
                        
                    }
                    .accentColor(.black)
                    .padding()
                   
                    
                }
            }
            .navigationTitle("Learn Swift")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
