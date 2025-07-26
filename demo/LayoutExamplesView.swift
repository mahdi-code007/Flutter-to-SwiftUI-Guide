//
//  LayoutExamplesView.swift
//  Flutter to SwiftUI Guide
//
//  Created and developed by Mahdi Abd El-Mageed
//  Educational module demonstrating SwiftUI layouts (VStack, HStack, ZStack)
//  Custom examples comparing Flutter widgets to SwiftUI views
//

import SwiftUI

struct LayoutExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // MARK: - Example 1: VStack (SwiftUI equivalent to Flutter's Column)
                Text("VStack - مثل Column في فلاتر")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.trailing)
                
                VStack(spacing: 10) {
                    Text("عنصر 1")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(8)
                    
                    Text("عنصر 2")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(8)
                    
                    Text("عنصر 3")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding()
                
                Divider()
                
                // MARK: - Example 2: HStack (SwiftUI equivalent to Flutter's Row)
                Text("HStack - مثل Row في فلاتر")
                    .font(.title2)
                    .bold()
                
                HStack(spacing: 10) {
                    Text("A")
                        .frame(width: 50, height: 50)
                        .background(Color.orange)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                    
                    Text("B")
                        .frame(width: 50, height: 50)
                        .background(Color.purple)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                    
                    Text("C")
                        .frame(width: 50, height: 50)
                        .background(Color.pink)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                }
                .padding()
                
                Divider()
                
                // MARK: - Example 3: ZStack (SwiftUI equivalent to Flutter's Stack)
                Text("ZStack - مثل Stack في فلاتر")
                    .font(.title2)
                    .bold()
                
                ZStack {
                    // الطبقة الخلفية
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                    
                    // الطبقة الوسط
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                    
                    // الطبقة الأمامية
                    Text("نص فوق الكل")
                        .foregroundColor(.white)
                        .font(.bold(.title3)())
                }
                .padding()
                
                Divider()
                
                // MARK: - Example 4: Complex Layout (SwiftUI equivalent to Flutter's Scaffold)
                Text("تخطيط معقد - مثل Scaffold في فلاتر")
                    .font(.title2)
                    .bold()
                
                VStack {
                    // Header
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Mahdi Abd El-Mageed")
                                .font(.title3)
                                .bold()
                            Text("مطور تطبيقات")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .font(.title2)
                        }
                    }
                    
                    // Content
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 100)
                        .overlay(
                            Text("محتوى الكارت")
                                .font(.title2)
                                .foregroundColor(.gray)
                        )
                    
                    // Actions
                    HStack {
                        Button("إعجاب") {}
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Button("تعليق") {}
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        Button("مشاركة") {}
                            .foregroundColor(.orange)
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()
            }
        }
        .navigationTitle("أمثلة التخطيط")
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    NavigationView {
        LayoutExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 