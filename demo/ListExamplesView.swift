import SwiftUI

struct ListExamplesView: View {
    @State private var items = ["عنصر 1", "عنصر 2", "عنصر 3", "عنصر 4", "عنصر 5"]
    @State private var newItem = ""
    @State private var showingAddDialog = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // MARK: - مثال 1: List بسيط (مثل ListView في فلاتر)
                VStack(alignment: .trailing) {
                    Text("List بسيط - مثل ListView في فلاتر")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    List(items, id: \.self) { item in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(item)
                            Spacer()
                            Text("تفاصيل")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                }
                
                // MARK: - مثال 2: List مع إضافة وحذف
                VStack(alignment: .trailing) {
                    HStack {
                        Text("List تفاعلي - إضافة وحذف")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        Button(action: {
                            showingAddDialog = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)
                    
                    List {
                        ForEach(items, id: \.self) { item in
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                                Text(item)
                                Spacer()
                                Button("حذف") {
                                    if let index = items.firstIndex(of: item) {
                                        items.remove(at: index)
                                    }
                                }
                                .foregroundColor(.red)
                                .font(.caption)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                }
                .alert("إضافة عنصر جديد", isPresented: $showingAddDialog) {
                    TextField("اسم العنصر", text: $newItem)
                        .multilineTextAlignment(.trailing)
                    Button("إضافة") {
                        if !newItem.isEmpty {
                            items.append(newItem)
                            newItem = ""
                        }
                    }
                    Button("إلغاء", role: .cancel) {
                        newItem = ""
                    }
                }
                
                // MARK: - مثال 3: NavigationLink (مثل Navigator.push في فلاتر)
                VStack(alignment: .trailing) {
                    Text("Navigation - مثل Navigator.push في فلاتر")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    VStack(spacing: 10) {
                        NavigationLink(destination: DetailView(title: "الصفحة الأولى", content: "هذا محتوى الصفحة الأولى")) {
                            HStack {
                                Image(systemName: "doc.text")
                                    .foregroundColor(.blue)
                                Text("انتقل للصفحة الأولى")
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: DetailView(title: "الصفحة الثانية", content: "هذا محتوى الصفحة الثانية")) {
                            HStack {
                                Image(systemName: "photo")
                                    .foregroundColor(.green)
                                Text("انتقل للصفحة الثانية")
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // MARK: - مثال 4: Form (مثل Form في فلاتر)
                VStack(alignment: .trailing) {
                    Text("Form - مثل Form في فلاتر")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Form {
                        Section(header: Text("معلومات شخصية")) {
                            TextField("الاسم", text: .constant("Mahdi Abd El-Mageed"))
                                .multilineTextAlignment(.trailing)
                            TextField("البريد الإلكتروني", text: .constant("mahdi.abdelmageed@example.com"))
                                .multilineTextAlignment(.trailing)
                            Toggle("تلقي الإشعارات", isOn: .constant(true))
                        }
                        
                        Section(header: Text("الإعدادات")) {
                            Picker("اللغة", selection: .constant(0)) {
                                Text("العربية").tag(0)
                                Text("English").tag(1)
                            }
                            Stepper("العمر: 25", value: .constant(25))
                        }
                        
                        Section {
                            Button("حفظ") {
                                // عملية الحفظ
                            }
                            .foregroundColor(.blue)
                        }
                    }
                    .frame(height: 300)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("القوائم والنماذج")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
    }
    
    func deleteItems(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

// صفحة تفاصيل منفصلة
struct DetailView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(content)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button("عودة") {
                // سيتم التعامل مع هذا تلقائياً بواسطة NavigationView
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    NavigationView {
        ListExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 