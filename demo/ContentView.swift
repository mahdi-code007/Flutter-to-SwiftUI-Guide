//
//  ContentView.swift
//  Flutter to SwiftUI Guide
//
//  Created and developed by Mahdi Abd El-Mageed on 09/07/2025.
//  Educational app for Flutter developers learning SwiftUI
//  All code written from scratch with custom implementations
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // العنوان الرئيسي
                Text("تعلم SwiftUI")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.top)
                
                Text("للمطورين القادمين من Flutter")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                // Basic Examples Section - Custom implementation by Mahdi Abd El-Mageed
                VStack(spacing: 15) {
                    // Quick Interactive Example - Shows immediate SwiftUI concepts
                    VStack {
                        Text("مثال بسيط:")
                            .font(.title3)
                            .bold()
                        
                        HStack {
                            // SwiftUI equivalent to Flutter's Icon widget
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.red)
                            
                            // SwiftUI equivalent to Flutter's Text widget
                            Text("مرحباً بك!")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    
                    // Navigation Examples List - Educational modules designed by Mahdi
                    VStack(spacing: 10) {
                        NavigationLink(destination: LayoutExamplesView()) {
                            HStack {
                                Image(systemName: "rectangle.3.group")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("أمثلة التخطيط")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("VStack, HStack, ZStack")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: StateManagementExamplesView()) {
                            HStack {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("إدارة الحالة")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("@State, @Binding, التفاعل")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: ListExamplesView()) {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.orange)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("القوائم والنماذج")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Lists, Forms, Navigation")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: ComparisonGuideView()) {
                            HStack {
                                Image(systemName: "text.book.closed")
                                    .foregroundColor(.purple)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("مقارنة شاملة")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("SwiftUI vs Flutter")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: AdvancedExamplesView()) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("أمثلة متقدمة")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Animations, Gestures, Custom Views")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: UIComponentsExamplesView()) {
                            HStack {
                                Image(systemName: "menucard")
                                    .foregroundColor(.pink)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("مكونات الواجهة")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Bottom Sheet, Dialog, Date Picker, Image Picker")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        NavigationLink(destination: TabViewExamplesView()) {
                            HStack {
                                Image(systemName: "square.split.bottomrightquarter")
                                    .foregroundColor(.indigo)
                                    .font(.title2)
                                
                                VStack(alignment: .leading) {
                                    Text("TabView و التنقل")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Bottom Navigation, Page View, Badges")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                    }
                }
                
                Spacer()
                
                // نصائح سريعة
                VStack {
                    Text("💡 نصائح سريعة")
                        .font(.headline)
                        .bold()
                    
                    Text("• استخدم $ للربط بين المتغيرات\n• SwiftUI يعيد رسم الواجهة تلقائياً\n• استخدم Preview للمعاينة السريعة\n• .sheet للـ Bottom Sheets\n• .alert للـ Dialogs\n• TabView للتنقل بين الصفحات")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle("SwiftUI للمطورين")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    ContentView()
        .environment(\.layoutDirection, .rightToLeft)
}
