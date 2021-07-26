
import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                LottieView(name: "lemonade", play: true, loop: true)
                    .frame(width: 80, height: 80, alignment: .center)
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                Text("Lemons")
                    .font(.system(.largeTitle, design: .serif))
                    .bold()
                Text("Intrinsic Value Calculator")
                    .font(.system(.subheadline, design: .serif))
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("What It Is")
                    .font(.system(.headline, design: .serif))
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                Text("Lemons is a calculator that lets you to project the intrinsic value of a company over time. It's really great for understanding what a company is actually worth.")
                    .font(.system(.subheadline, design: .serif))
            }
            .padding()
            
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))

            VStack(alignment: .leading, spacing: 12) {
                Text("How To Use It")
                    .font(.system(.headline, design: .serif))
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                Text("Find a company you're interested in and look up their investor relations page. Most of information you need is there. Enter the information into the calculator and check out your results!")
                    .font(.system(.subheadline, design: .serif))
            }
            .padding()
            
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))

            VStack(alignment: .leading, spacing: 12) {
                Text("Why We Made It")
                    .font(.system(.headline, design: .serif))
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                Text("We wanted to make financial analysis tools more fun and accessible to use. Instead of using complex software on your laptop like Excel, you can do financial analysis right from your phone with Lemons!")
                    .font(.system(.subheadline, design: .serif))
            }
            .padding()
            
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                
            Text("Happy investing! 🍋")
                .font(.system(.footnote, design: .serif))
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
