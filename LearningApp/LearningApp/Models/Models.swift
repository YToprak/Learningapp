//
//  Models.swift
//  LearningApp
//
//  Created by Yüksel Toprak on 23.01.22.
//

import Foundation


struct Module: Decodable, Identifiable {
    
    var id: UUID?
    var category: String
    var content: Content
    var test: Test
    
}

struct Content: Decodable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
}

struct Lesson: Codable, Identifiable {
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}

struct Test: Codable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
}

struct Question: Codable, Identifiable {
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
