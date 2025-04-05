//
//  URLInputView.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//

import SwiftUI

struct URLInputView: View {
    @Binding var inputPath: String
    var handleURLSubmit:()->()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "link")
                .foregroundColor(.blue)

            TextField("Enter website URL", text: $inputPath)
                .keyboardType(.URL)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($isFocused)
                .textContentType(.URL)
                .submitLabel(.done)
                .onSubmit(handleURLSubmit)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isFocused ? Color.blue : Color.gray.opacity(0.3), lineWidth: 1.5)
                )
        )
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
    }
}

