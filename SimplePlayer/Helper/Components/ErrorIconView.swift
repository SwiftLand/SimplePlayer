//
//  ErrorIconView.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import SwiftUI

struct ErrorIconView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.red.opacity(0.1))
                .frame(width: 60, height: 60)

            Image(systemName: "exclamationmark.triangle.fill")
                .font(.title)
                .foregroundColor(.red)
        }
    }
}
