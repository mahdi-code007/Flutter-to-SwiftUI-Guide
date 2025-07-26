import SwiftUI

struct ComparisonGuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing, spacing: 25) {
                
                // MARK: - مقدمة
                VStack(alignment: .trailing, spacing: 10) {
                    Text("مقارنة شاملة: SwiftUI vs Flutter")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                    
                    Text("دليل شامل للمطورين القادمين من Flutter")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // MARK: - الأساسيات
                ComparisonSection(
                    title: "الأساسيات",
                    flutterCode: """
                    // Flutter
                    class MyWidget extends StatelessWidget {
                      @override
                      Widget build(BuildContext context) {
                        return Text('Hello World');
                      }
                    }
                    """,
                    swiftUICode: """
                    // SwiftUI
                    struct MyView: View {
                        var body: some View {
                            Text("Hello World")
                        }
                    }
                    """,
                    explanation: "في SwiftUI، كل view يجب أن يطبق بروتوكول View ويحتوي على body property"
                )
                
                // MARK: - التخطيط
                ComparisonSection(
                    title: "التخطيط - Layout",
                    flutterCode: """
                    // Flutter
                    Column(
                      children: [
                        Text('Item 1'),
                        Text('Item 2'),
                        Row(
                          children: [
                            Text('A'),
                            Text('B')
                          ]
                        )
                      ]
                    )
                    """,
                    swiftUICode: """
                    // SwiftUI
                    VStack {
                        Text("Item 1")
                        Text("Item 2")
                        HStack {
                            Text("A")
                            Text("B")
                        }
                    }
                    """,
                    explanation: "VStack = Column, HStack = Row, ZStack = Stack"
                )
                
                // MARK: - إدارة الحالة
                ComparisonSection(
                    title: "إدارة الحالة",
                    flutterCode: """
                    // Flutter
                    class Counter extends StatefulWidget {
                      @override
                      _CounterState createState() => _CounterState();
                    }
                    
                    class _CounterState extends State<Counter> {
                      int counter = 0;
                      
                      void increment() {
                        setState(() {
                          counter++;
                        });
                      }
                    }
                    """,
                    swiftUICode: """
                    // SwiftUI
                    struct Counter: View {
                        @State private var counter = 0
                        
                        var body: some View {
                            Button("العدد: \\(counter)") {
                                counter += 1
                            }
                        }
                    }
                    """,
                    explanation: "@State يعادل setState في Flutter - يعيد بناء الواجهة عند التغيير"
                )
                
                // MARK: - التنقل
                ComparisonSection(
                    title: "التنقل - Navigation",
                    flutterCode: """
                    // Flutter
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen()
                      )
                    );
                    """,
                    swiftUICode: """
                    // SwiftUI
                    NavigationView {
                        NavigationLink(
                            destination: SecondScreen()
                        ) {
                            Text("انتقل للصفحة التالية")
                        }
                    }
                    """,
                    explanation: "NavigationLink تعادل Navigator.push في Flutter"
                )
                
                // MARK: - القوائم
                ComparisonSection(
                    title: "القوائم - Lists",
                    flutterCode: """
                    // Flutter
                    ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index])
                        );
                      }
                    )
                    """,
                    swiftUICode: """
                    // SwiftUI
                    List(items, id: \\.self) { item in
                        Text(item)
                    }
                    """,
                    explanation: "List في SwiftUI أبسط من ListView في Flutter"
                )
                
                // MARK: - التصميم
                ComparisonSection(
                    title: "التصميم - Styling",
                    flutterCode: """
                    // Flutter
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text('Styled Text')
                    )
                    """,
                    swiftUICode: """
                    // SwiftUI
                    Text("Styled Text")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                    """,
                    explanation: "SwiftUI يستخدم modifier pattern بدلاً من nested widgets"
                )
                
                // MARK: - الأزرار
                ComparisonSection(
                    title: "الأزرار - Buttons",
                    flutterCode: """
                    // Flutter
                    ElevatedButton(
                      onPressed: () {
                        print('Button pressed');
                      },
                      child: Text('اضغط هنا')
                    )
                    """,
                    swiftUICode: """
                    // SwiftUI
                    Button("اضغط هنا") {
                        print("Button pressed")
                    }
                    """,
                    explanation: "Button في SwiftUI أكثر مرونة في التخصيص"
                )
                
                // MARK: - النماذج
                ComparisonSection(
                    title: "النماذج - Forms",
                    flutterCode: """
                    // Flutter
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          inputText = value;
                        });
                      }
                    )
                    """,
                    swiftUICode: """
                    // SwiftUI
                    TextField("اكتب هنا", text: $inputText)
                    """,
                    explanation: "$ في SwiftUI يعني two-way binding، مثل TextEditingController في Flutter"
                )
                
                // MARK: - نصائح مهمة
                VStack(alignment: .trailing, spacing: 15) {
                    Text("💡 نصائح مهمة للانتقال")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.orange)
                    
                                    VStack(alignment: .trailing, spacing: 8) {
                    TipRow(icon: "1.circle.fill", tip: "SwiftUI declarative مثل Flutter تماماً")
                    TipRow(icon: "2.circle.fill", tip: "استخدم @State للمتغيرات المحلية")
                    TipRow(icon: "3.circle.fill", tip: "استخدم $ للـ binding (two-way)")
                    TipRow(icon: "4.circle.fill", tip: "Modifiers تطبق بالترتيب")
                    TipRow(icon: "5.circle.fill", tip: "Preview مفيد جداً للتطوير السريع")
                }
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                
            }
            .padding()
        }
        .navigationTitle("مقارنة شاملة")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .rightToLeft)
    }
}

// مكون لعرض المقارنة
struct ComparisonSection: View {
    let title: String
    let flutterCode: String
    let swiftUICode: String
    let explanation: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.blue)
            
            VStack(alignment: .trailing, spacing: 10) {
                // Flutter Code
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Flutter:")
                        .font(.headline)
                        .foregroundColor(.green)
                    
                    Text(flutterCode)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // SwiftUI Code
                VStack(alignment: .trailing, spacing: 5) {
                    Text("SwiftUI:")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text(swiftUICode)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // Explanation
                Text(explanation)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

// مكون للنصائح
struct TipRow: View {
    let icon: String
    let tip: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.orange)
            Text(tip)
                .font(.body)
            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        ComparisonGuideView()
    }
    .environment(\.layoutDirection, .rightToLeft)
} 