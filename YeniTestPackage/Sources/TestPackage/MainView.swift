//
//  MainView.swift
//  BoilerplateProject
//
//  Created by Ebuzer Şimşek on 20.11.2024.
//

import SwiftUI

public struct MainView: View {
    
    public init() {}
    
    
    public var body: some View {
        
        
        
        TabView {
            Text("")
        
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}


#Preview {
    MainView()
}
