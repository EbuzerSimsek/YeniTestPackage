//
//  SafariView.swift
//  BoilerplateProject
//
//  Created by Ebuzer Şimşek on 20.11.2024.
//

import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    
    public init(url: URL) {
        self.url = url
    }
    
    let url: URL

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}

#Preview {
    SafariView(url: URL(string: "")!)
}
