import SwiftUI

struct AdvancedExamplesView: View {
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1: Animations
            AnimationsExampleView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("رسوم متحركة")
                }
                .tag(0)
            
            // Tab 2: Gestures
            GesturesExampleView()
                .tabItem {
                    Image(systemName: "hand.tap")
                    Text("الإيماءات")
                }
                .tag(1)
            
            // Tab 3: Custom Components
            CustomComponentsView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("مكونات مخصصة")
                }
                .tag(2)
            
            // Tab 4: Page Style TabView
            VStack(spacing: 20) {
                Text("Page Style TabView")
                    .font(.title)
                    .bold()
                    .foregroundColor(.cyan)
                
                Text("مثل PageView في Flutter")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                PageStyleTabViewExample()
            }
            .tabItem {
                Image(systemName: "doc.on.doc.fill")
                Text("Page View")
            }
            .tag(3)
        }
        .navigationTitle("أمثلة متقدمة")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Animations Examples
struct AnimationsExampleView: View {
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("الرسوم المتحركة في SwiftUI")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                
                // Basic Animation
                VStack {
                    Text("رسم متحرك بسيط")
                        .font(.headline)
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 1.0), value: scale)
                    
                    Button("تحريك") {
                        scale = scale == 1.0 ? 1.5 : 1.0
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Rotation Animation
                VStack {
                    Text("دوران")
                        .font(.headline)
                    
                    Image(systemName: "gear")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(rotation))
                        .animation(.linear(duration: 2.0).repeatForever(autoreverses: false), value: rotation)
                    
                    Button("تدوير") {
                        rotation += 360
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Spring Animation
                VStack {
                    Text("رسم متحرك مرن")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(width: isAnimating ? 200 : 100, height: 50)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isAnimating)
                    
                    Button("تحريك مرن") {
                        isAnimating.toggle()
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Comparison with Flutter
                VStack(alignment: .trailing, spacing: 10) {
                    Text("مقارنة مع Flutter")
                        .font(.headline)
                        .foregroundColor(.purple)
                    
                    Text("SwiftUI:")
                        .font(.subheadline)
                        .bold()
                    Text(".animation(.spring(), value: property)")
                        .font(.system(.caption, design: .monospaced))
                        .padding(.horizontal)
                    
                    Text("Flutter:")
                        .font(.subheadline)
                        .bold()
                    Text("AnimationController + Tween")
                        .font(.system(.caption, design: .monospaced))
                        .padding(.horizontal)
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(15)
            }
            .padding()
        }
    }
}

// MARK: - Gestures Examples
struct GesturesExampleView: View {
    @State private var dragOffset = CGSize.zero
    @State private var tapCount = 0
    @State private var longPressCount = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("الإيماءات في SwiftUI")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                
                // Drag Gesture
                VStack {
                    Text("إيماءة السحب")
                        .font(.headline)
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .offset(dragOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation
                                }
                                .onEnded { _ in
                                    dragOffset = .zero
                                }
                        )
                    
                    Text("اسحب الدائرة!")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Tap Gesture
                VStack {
                    Text("إيماءة النقر")
                        .font(.headline)
                    
                    Text("عدد النقرات: \(tapCount)")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                        .onTapGesture {
                            tapCount += 1
                        }
                    
                    Button("إعادة تعيين") {
                        tapCount = 0
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Long Press Gesture
                VStack {
                    Text("إيماءة الضغط المطول")
                        .font(.headline)
                    
                    Text("عدد الضغطات المطولة: \(longPressCount)")
                        .font(.title3)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .onLongPressGesture {
                            longPressCount += 1
                        }
                    
                    Text("اضغط مطولاً على النص أعلاه")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Comparison with Flutter
                VStack(alignment: .trailing, spacing: 10) {
                    Text("مقارنة مع Flutter")
                        .font(.headline)
                        .foregroundColor(.purple)
                    
                    Text("SwiftUI:")
                        .font(.subheadline)
                        .bold()
                    Text(".onTapGesture { }\n.gesture(DragGesture())")
                        .font(.system(.caption, design: .monospaced))
                        .padding(.horizontal)
                    
                    Text("Flutter:")
                        .font(.subheadline)
                        .bold()
                    Text("GestureDetector(\n  onTap: () {},\n  onPanUpdate: () {}\n)")
                        .font(.system(.caption, design: .monospaced))
                        .padding(.horizontal)
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(15)
            }
            .padding()
        }
    }
}

// MARK: - Custom Components
struct CustomComponentsView: View {
    @State private var isLiked = false
    @State private var rating = 3
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("مكونات مخصصة")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                
                // Custom Button
                VStack {
                    Text("زر مخصص")
                        .font(.headline)
                    
                    CustomButton(title: "زر مخصص", icon: "heart.fill", color: .red) {
                        isLiked.toggle()
                    }
                    
                    if isLiked {
                        Text("تم الإعجاب! ❤️")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Custom Card
                VStack {
                    Text("كارت مخصص")
                        .font(.headline)
                    
                    CustomCard(
                        title: "عنوان الكارت",
                        subtitle: "وصف الكارت",
                        icon: "star.fill",
                        color: .orange
                    )
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Custom Rating
                VStack {
                    Text("تقييم مخصص")
                        .font(.headline)
                    
                    CustomRating(rating: $rating)
                    
                    Text("التقييم: \(rating)/5")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Code Example
                VStack(alignment: .trailing, spacing: 10) {
                    Text("مثال على الكود")
                        .font(.headline)
                        .foregroundColor(.purple)
                    
                    Text("""
                    struct CustomButton: View {
                        let title: String
                        let action: () -> Void
                        
                        var body: some View {
                            Button(action: action) {
                                Text(title)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    """)
                    .font(.system(.caption, design: .monospaced))
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(15)
            }
            .padding()
        }
    }
}

// MARK: - Custom Button Component
struct CustomButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.headline)
            }
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}

// MARK: - Custom Card Component
struct CustomCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .trailing) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// MARK: - Custom Rating Component
struct CustomRating: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { star in
                Image(systemName: star <= rating ? "star.fill" : "star")
                    .font(.title2)
                    .foregroundColor(star <= rating ? .yellow : .gray)
                    .onTapGesture {
                        rating = star
                    }
            }
        }
    }
}

#Preview {
    NavigationView {
        AdvancedExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 