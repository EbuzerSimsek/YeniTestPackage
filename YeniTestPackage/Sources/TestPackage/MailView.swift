//
//  MailView.swift
//  BoilerplateProject
//
//  Created by Ebuzer Şimşek on 20.11.2024.
//

import SwiftUI
import MessageUI

public struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView

        public init(_ parent: MailView) {
            self.parent = parent
        }

        public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                parent.presentation.wrappedValue.dismiss()
            }

            if let error = error {
                parent.result = .failure(error)
            } else {
                parent.result = .success(result)
            }
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("Contact Us")
        vc.setToRecipients(["ebuzer6060@gmail.com"])
        return vc
    }

    public func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}

