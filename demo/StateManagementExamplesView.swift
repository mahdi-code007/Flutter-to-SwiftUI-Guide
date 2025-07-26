//
//  StateManagementExamplesView.swift
//  Flutter to SwiftUI Guide
//
//  Created and developed by Mahdi Abd El-Mageed
//  Educational module demonstrating SwiftUI state management (@State, @Binding)
//  Custom examples showing SwiftUI reactive programming patterns
//

import SwiftUI

struct StateManagementExamplesView: View {
    // SwiftUI state management - equivalent to StatefulWidget in Flutter
    @State private var counter = 0
    @State private var isToggled = false
    @State private var sliderValue = 0.5
    @State private var textInput = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // MARK: - Example 1: Counter (SwiftUI equivalent to setState in Flutter)
                VStack {
                    Text("Counter - مثل setState في فلاتر")
                        .font(.title2)
                        .bold()
                    
                    Text("العدد: \(counter)")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    HStack {
                        Button("تقليل") {
                            counter -= 1
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("زيادة") {
                            counter += 1
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Divider()
                
                // MARK: - Example 2: Toggle Switch (SwiftUI equivalent to Switch in Flutter)
                VStack {
                    Text("Toggle Switch - مثل Switch في فلاتر")
                        .font(.title2)
                        .bold()
                    
                    Toggle("تفعيل الوضع الليلي", isOn: $isToggled)
                        .padding()
                    
                    Text(isToggled ? "الوضع الليلي مفعل" : "الوضع الليلي مُعطل")
                        .foregroundColor(isToggled ? .white : .black)
                        .padding()
                        .background(isToggled ? Color.black : Color.white)
                        .cornerRadius(8)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Divider()
                
                // MARK: - Example 3: Slider (SwiftUI equivalent to Slider in Flutter)
                VStack {
                    Text("Slider - مثل Slider في فلاتر")
                        .font(.title2)
                        .bold()
                    
                    VStack {
                        Text("القيمة: \(Int(sliderValue * 100))")
                            .font(.title3)
                        
                        Slider(value: $sliderValue, in: 0...1)
                            .accentColor(.blue)
                        
                        // مثال على تغيير اللون حسب القيمة
                        Circle()
                            .fill(Color.blue.opacity(sliderValue))
                            .frame(width: 100, height: 100)
                    }
                    .padding()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Divider()
                
                // MARK: - Example 4: TextField (SwiftUI equivalent to TextField in Flutter)
                VStack {
                    Text("TextField - مثل TextField في فلاتر")
                        .font(.title2)
                        .bold()
                    
                    TextField("اكتب شيئاً...", text: $textInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .flipsForRightToLeftLayoutDirection(true)
                        .padding()
                    
                    if !textInput.isEmpty {
                        Text("كتبت: \(textInput)")
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Button("مسح النص") {
                        textInput = ""
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Divider()
                
                // MARK: - مثال 5: مثال متقدم - تفاعل بين عدة states
                VStack {
                    Text("مثال متقدم - تفاعل عدة states")
                        .font(.title2)
                        .bold()
                    
                    VStack {
                        Text("النتيجة: \(calculateResult())")
                            .font(.title)
                            .foregroundColor(.purple)
                        
                        HStack {
                            VStack {
                                Text("Counter: \(counter)")
                                Button("×2") {
                                    counter *= 2
                                }
                                .padding(.horizontal)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                            
                            VStack {
                                Text("Slider: \(Int(sliderValue * 100))")
                                Button("Reset") {
                                    sliderValue = 0.5
                                }
                                .padding(.horizontal)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("إدارة الحالة")
        .environment(\.layoutDirection, .rightToLeft)
    }
    
    // دالة مساعدة لحساب النتيجة
    private func calculateResult() -> Int {
        return counter + Int(sliderValue * 100)
    }
}

#Preview {
    NavigationView {
        StateManagementExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 