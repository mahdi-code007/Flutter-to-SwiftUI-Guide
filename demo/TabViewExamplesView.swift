import SwiftUI

struct TabViewExamplesView: View {
    @State private var selectedTab = 0
    @State private var badgeCount = 3
    @State private var showingSettings = false
    
    var body: some View {
        VStack(spacing: 0) {
            // العنوان الرئيسي
            VStack(spacing: 10) {
                Text("TabView في SwiftUI")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                
                Text("مثل BottomNavigationBar في Flutter")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            
            // TabView الأساسي
            TabView(selection: $selectedTab) {
                // Tab 1: الرئيسية
                HomeTabContent()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("الرئيسية")
                    }
                    .tag(0)
                
                // Tab 2: البحث
                SearchTabContent()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("البحث")
                    }
                    .tag(1)
                
                // Tab 3: الإشعارات مع Badge
                NotificationsTabContent(badgeCount: $badgeCount)
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("الإشعارات")
                    }
                    .badge(badgeCount > 0 ? badgeCount : 4)
                    .tag(2)
                
                // Tab 4: الملف الشخصي
                ProfileTabContent()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("الملف الشخصي")
                    }
                    .tag(3)
                
                // Tab 5: الإعدادات
                SettingsTabContent()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("الإعدادات")
                    }
                    .tag(4)
            }
            .accentColor(.blue)
            .environment(\.layoutDirection, .rightToLeft)
        }
        .navigationTitle("TabView Examples")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Home Tab Content
struct HomeTabContent: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("الصفحة الرئيسية")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    // مقارنة مع Flutter
                    VStack(alignment: .trailing, spacing: 15) {
                        Text("مقارنة TabView مع Flutter")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.green)
                        
                        VStack(alignment: .trailing, spacing: 8) {
                            Text("Flutter:")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text("""
                            Scaffold(
                              bottomNavigationBar: BottomNavigationBar(
                                currentIndex: selectedIndex,
                                onTap: (index) => setState(() {
                                  selectedIndex = index;
                                }),
                                items: [
                                  BottomNavigationBarItem(
                                    icon: Icon(Icons.home),
                                    label: 'الرئيسية',
                                  ),
                                  // ... more items
                                ],
                              ),
                            )
                            """)
                            .font(.system(.caption, design: .monospaced))
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                            
                            Text("SwiftUI:")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Text("""
                            TabView(selection: $selectedTab) {
                                HomeView()
                                    .tabItem {
                                        Image(systemName: "house.fill")
                                        Text("الرئيسية")
                                    }
                                    .tag(0)
                                // ... more tabs
                            }
                            """)
                            .font(.system(.caption, design: .monospaced))
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    
                    // خصائص TabView
                    VStack(alignment: .trailing, spacing: 15) {
                        Text("خصائص TabView المتقدمة")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.purple)
                        
                        VStack(alignment: .trailing, spacing: 10) {
                            FeatureRow(icon: "1.circle.fill", title: "Badge Support", description: "عرض إشعارات أو أرقام على التبويبات")
                            FeatureRow(icon: "2.circle.fill", title: "Custom Colors", description: "تخصيص ألوان التبويبات والأيقونات")
                            FeatureRow(icon: "3.circle.fill", title: "Dynamic Tabs", description: "إضافة أو إزالة تبويبات ديناميكياً")
                            FeatureRow(icon: "4.circle.fill", title: "Page Style", description: "أسلوب الصفحات بدلاً من التبويبات")
                            FeatureRow(icon: "5.circle.fill", title: "Programmatic Control", description: "التحكم في التبويب المحدد برمجياً")
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                }
                .padding()
            }
            .navigationTitle("الرئيسية")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Search Tab Content
struct SearchTabContent: View {
    @State private var searchText = ""
    @State private var searchResults = ["نتيجة 1", "نتيجة 2", "نتيجة 3"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("البحث")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                
                SearchBar(text: $searchText)
                
                List(searchResults.filter { searchText.isEmpty || $0.contains(searchText) }, id: \.self) { result in
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.green)
                        Text(result)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("البحث")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Notifications Tab Content
struct NotificationsTabContent: View {
    @Binding var badgeCount: Int
    @State private var notifications = [
        "إشعار جديد 1",
        "إشعار جديد 2", 
        "إشعار جديد 3"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("الإشعارات")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    if badgeCount > 0 {
                        Text("\(badgeCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red)
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
                
                List {
                    ForEach(notifications, id: \.self) { notification in
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.orange)
                            Text(notification)
                            Spacer()
                            Button("قراءة") {
                                if let index = notifications.firstIndex(of: notification) {
                                    notifications.remove(at: index)
                                    badgeCount = max(0, badgeCount - 1)
                                }
                            }
                            .foregroundColor(.blue)
                        }
                        .padding(.vertical, 5)
                    }
                    .onDelete(perform: deleteNotification)
                }
                
                Button("إضافة إشعار") {
                    notifications.append("إشعار جديد \(notifications.count + 1)")
                    badgeCount += 1
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationTitle("الإشعارات")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
    
    func deleteNotification(offsets: IndexSet) {
        notifications.remove(atOffsets: offsets)
        badgeCount = max(0, badgeCount - 1)
    }
}

// MARK: - Profile Tab Content
struct ProfileTabContent: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // صورة الملف الشخصي
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                
                Text("Mahdi Abd El-Mageed")
                    .font(.title)
                    .bold()
                
                Text("مطور تطبيقات")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // معلومات الملف الشخصي
                VStack(spacing: 15) {
                    ProfileInfoRow(icon: "envelope.fill", title: "البريد الإلكتروني", value: "mahdi.abdelmageed@example.com")
                    ProfileInfoRow(icon: "phone.fill", title: "الهاتف", value: "+1234567890")
                    ProfileInfoRow(icon: "location.fill", title: "الموقع", value: "القاهرة، مصر")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
            .navigationTitle("الملف الشخصي")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Settings Tab Content
struct SettingsTabContent: View {
    @State private var isNotificationsEnabled = true
    @State private var isDarkModeEnabled = false
    @State private var selectedLanguage = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("الإعدادات العامة")) {
                    Toggle("الإشعارات", isOn: $isNotificationsEnabled)
                    Toggle("الوضع الليلي", isOn: $isDarkModeEnabled)
                    
                    Picker("اللغة", selection: $selectedLanguage) {
                        Text("العربية").tag(0)
                        Text("English").tag(1)
                    }
                }
                
                Section(header: Text("حول التطبيق")) {
                    HStack {
                        Text("الإصدار")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("المطور")
                        Spacer()
                        Text("Mahdi Abd El-Mageed")
                            .foregroundColor(.gray)
                    }
                }
                
                Section {
                    Button("تسجيل الخروج") {
                        // Handle logout
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("الإعدادات")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Helper Components

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("ابحث...", text: $text)
                .multilineTextAlignment(.trailing)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Image(systemName: icon)
                .foregroundColor(.purple)
                .font(.title2)
        }
    }
}

struct ProfileInfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.body)
            }
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.title3)
        }
    }
}

// MARK: - Page Style TabView Example
struct PageStyleTabViewExample: View {
    @State private var selectedPage = 0
    
    var body: some View {
        VStack {
            Text("Page Style TabView")
                .font(.title2)
                .bold()
                .padding()
            
            TabView(selection: $selectedPage) {
                PageContent(color: .red, title: "الصفحة الأولى", pageNumber: 1)
                    .tag(0)
                
                PageContent(color: .green, title: "الصفحة الثانية", pageNumber: 2)
                    .tag(1)
                
                PageContent(color: .blue, title: "الصفحة الثالثة", pageNumber: 3)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct PageContent: View {
    let color: Color
    let title: String
    let pageNumber: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text("محتوى الصفحة \(pageNumber)")
                .font(.body)
                .foregroundColor(.white)
            
            Image(systemName: "\(pageNumber).circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    NavigationView {
        TabViewExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 
