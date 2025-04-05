//
//  LinkPlayIconView.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import SwiftUI

struct LinkPlayIconView: View {
    var body: some View {
        Image(systemName: "link.icloud.fill")
        .font(.title2)
        .foregroundColor(.blue)
        .padding(10)
        .background(Color.blue.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
