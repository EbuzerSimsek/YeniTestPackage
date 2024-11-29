//
//  SettingsView.swift
//  BoilerplateProject
//
//  Created by Ebuzer Şimşek on 20.11.2024.
//

import SwiftUI
import MessageUI
import SafariServices

public struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
//    @Environment(\.requestReview) var requestReview
    @State private var isDarkMode: Bool = false
    @State private var showMailView = false
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
    @State private var showFeatureRequestSheet = false
    @State private var showPrivacyPolicy = false
    @State private var showTermsOfService = false
    
    public init() {
//        WishKit.configure(with: "DDDC35A8-86FB-4CD3-90A4-F22F15D9EF76")
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("App Settings")) {
                        HStack {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.min.fill")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Toggle(isOn: $isDarkMode) {
                                Text("Dark Mode")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            .onChange(of: isDarkMode) { value in
                                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = value ? .dark : .light
                            }
                        }
                    }
                    
                   
                    
                    Section(header: Text("Feedback & Support")) {
                        Button(action: {
                            showFeatureRequestSheet.toggle()
                        }) {
                            HStack {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .padding(.leading, 3)
                                Text("Feature Request")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        
                        
                        Button(action: {
//                            requestReview()
                        }) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Rate Us")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        
                        Button(action: {
                            self.showMailView.toggle()
                        }) {
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Contact Us")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        .disabled(!MFMailComposeViewController.canSendMail())
                    }
                    
                    Section(header: Text("Legal Information")) {
                        Button(action: {
                            showPrivacyPolicy = true
                        }) {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Privacy Policy")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        
                        Button(action: {
                            showTermsOfService = true
                        }) {
                            HStack {
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Terms of Service")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
            .sheet(isPresented: $showMailView) {
                MailView(result: self.$mailResult)
            }
            .sheet(isPresented: $showPrivacyPolicy) {
                        if let url = URL(string: "https://ebuzersimsek.wordpress.com/35-2/") {
                            SafariView(url: url)
                        }
                }
            .sheet(isPresented: $showTermsOfService) {
                        if let url = URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/") {
                            SafariView(url: url)
                        }
                }
            
        
        }
    }
}

#Preview {
    SettingsView()
}
