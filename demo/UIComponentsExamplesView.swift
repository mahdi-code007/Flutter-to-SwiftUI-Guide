import SwiftUI
import PhotosUI

struct UIComponentsExamplesView: View {
    @State private var showingBottomSheet = false
    @State private var showingAlert = false
    @State private var showingActionSheet = false
    @State private var selectedDate = Date()
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("مكونات الواجهة المتقدمة")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.trailing)
                
                // MARK: - Bottom Sheet Example
                VStack(alignment: .trailing, spacing: 15) {
                    Text("Bottom Sheet - مثل showModalBottomSheet في Flutter")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                    
                    Button("عرض Bottom Sheet") {
                        showingBottomSheet = true
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Flutter:")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text("""
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(...)
                        );
                        """)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        
                        Text("SwiftUI:")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text("""
                        .sheet(isPresented: $showingBottomSheet) {
                            BottomSheetContent()
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
                
                // MARK: - Dialog Examples
                VStack(alignment: .trailing, spacing: 15) {
                    Text("Dialogs - مثل AlertDialog في Flutter")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.red)
                    
                    HStack(spacing: 15) {
                        Button("Alert Dialog") {
                            alertTitle = "تنبيه"
                            alertMessage = "هذا مثال على Alert Dialog"
                            showingAlert = true
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Action Sheet") {
                            showingActionSheet = true
                        }
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Flutter:")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text("""
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('عنوان'),
                            content: Text('محتوى'),
                            actions: [...]
                          )
                        );
                        """)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        
                        Text("SwiftUI:")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text("""
                        .alert("عنوان", isPresented: $showingAlert) {
                            Button("موافق") { }
                            Button("إلغاء", role: .cancel) { }
                        } message: {
                            Text("محتوى الرسالة")
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
                
                // MARK: - Date Picker Example
                VStack(alignment: .trailing, spacing: 15) {
                    Text("Date Picker - مثل DatePicker في Flutter")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("التاريخ المحدد:")
                            .font(.headline)
                        
                        Text(selectedDate, style: .date)
                            .font(.title3)
                            .foregroundColor(.purple)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(10)
                        
                        DatePicker("اختر التاريخ", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .environment(\.locale, Locale(identifier: "ar"))
                            .padding()
                        
                        DatePicker("اختر الوقت", selection: $selectedDate, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .environment(\.locale, Locale(identifier: "ar"))
                            .padding()
                    }
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Flutter:")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text("""
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        """)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        
                        Text("SwiftUI:")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text("""
                        DatePicker("اختر التاريخ", 
                                  selection: $selectedDate, 
                                  displayedComponents: .date)
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
                
                // MARK: - Image Picker Example
                VStack(alignment: .trailing, spacing: 15) {
                    Text("Image Picker - مثل ImagePicker في Flutter")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.cyan)
                    
                    VStack(spacing: 15) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 200)
                                .cornerRadius(10)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 200)
                                .overlay(
                                    VStack {
                                        Image(systemName: "photo")
                                            .font(.system(size: 50))
                                            .foregroundColor(.gray)
                                        Text("لم يتم اختيار صورة")
                                            .foregroundColor(.gray)
                                    }
                                )
                        }
                        
                        HStack(spacing: 15) {
                            // PhotosPicker (iOS 16+)
                            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                                HStack {
                                    Image(systemName: "photo.on.rectangle")
                                    Text("اختر من المعرض")
                                }
                                .padding()
                                .background(Color.cyan)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            Button("التقط صورة") {
                                showingImagePicker = true
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Flutter:")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text("""
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery
                        );
                        """)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        
                        Text("SwiftUI:")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text("""
                        PhotosPicker(selection: $photosPickerItem, 
                                    matching: .images) {
                            Text("اختر صورة")
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
                
                // MARK: - نصائح مهمة
                VStack(alignment: .trailing, spacing: 15) {
                    Text("💡 نصائح مهمة")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.orange)
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        TipRowUI(icon: "1.circle.fill", tip: "استخدم @State للتحكم في ظهور وإخفاء المكونات")
                        TipRowUI(icon: "2.circle.fill", tip: "PhotosPicker يتطلب iOS 16+ أو أحدث")
                        TipRowUI(icon: "3.circle.fill", tip: "يمكن تخصيص DatePicker بأساليب مختلفة")
                        TipRowUI(icon: "4.circle.fill", tip: "Alert وActionSheet لها استخدامات مختلفة")
                        TipRowUI(icon: "5.circle.fill", tip: "Bottom Sheet مفيدة للخيارات والنماذج")
                    }
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("مكونات الواجهة")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
        
        // MARK: - Modifiers for UI Components
        .sheet(isPresented: $showingBottomSheet) {
            BottomSheetExampleView()
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("موافق") {
                // Handle OK action
            }
            Button("إلغاء", role: .cancel) {
                // Handle cancel action
            }
        } message: {
            Text(alertMessage)
        }
        .confirmationDialog("اختر خيار", isPresented: $showingActionSheet, titleVisibility: .visible) {
            Button("الخيار الأول") {
                // Handle first option
            }
            Button("الخيار الثاني") {
                // Handle second option
            }
            Button("خيار خطر", role: .destructive) {
                // Handle destructive action
            }
            Button("إلغاء", role: .cancel) {
                // Handle cancel
            }
        } message: {
            Text("اختر من الخيارات التالية")
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePickerView(selectedImage: $selectedImage)
        }
        .onChange(of: photosPickerItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImage = UIImage(data: data)
                }
            }
        }
    }
}

// MARK: - Bottom Sheet Content
struct BottomSheetExampleView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var isSubscribed = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 20) {
                Text("مثال على Bottom Sheet")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                VStack(alignment: .trailing, spacing: 15) {
                    Text("املأ البيانات التالية:")
                        .font(.headline)
                    
                    TextField("الاسم", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                    
                    TextField("البريد الإلكتروني", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                    
                    Toggle("الاشتراك في النشرة الإخبارية", isOn: $isSubscribed)
                    
                    HStack(spacing: 15) {
                        Button("إلغاء") {
                            dismiss()
                        }
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("حفظ") {
                            // Handle save action
                            dismiss()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("معلومات المستخدم")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("إغلاق") { dismiss() })
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// MARK: - Image Picker using UIKit
struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}

// MARK: - Tip Row Component for UI tips
struct TipRowUI: View {
    let icon: String
    let tip: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(tip)
                .font(.body)
            Image(systemName: icon)
                .foregroundColor(.orange)
        }
    }
}

#Preview {
    NavigationView {
        UIComponentsExamplesView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 