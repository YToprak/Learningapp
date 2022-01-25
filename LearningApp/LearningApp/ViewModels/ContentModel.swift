//
//  ContentModel.swift
//  LearningApp
//
//  Created by Yüksel Toprak on 23.01.22.
//

import Foundation


class ContentModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    
    //
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        
        getLocalData()
    }
    
    // MARK: - Data methods
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
        } catch {
            print(error)
        }
        
        //Parse the style Data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData

            
        } catch {
            print(error)
        }
        
        
        
    }
    
    //MARK:: - Module navigation methods
    
    func beginModule(_ moduleid: Int) {
        
        //find the index for this module id
        
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                currentModuleIndex = index
                break
            }
        }
        //set the current module
        currentModule = modules[currentModuleIndex]
        
    }
    
}
