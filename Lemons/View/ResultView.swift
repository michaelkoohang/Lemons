
import SwiftUI

struct ResultView: View {
    
    @ObservedObject var ivcModel: IvcModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading) {
                            Text(EntryFormatter.formatCurrency(val: ivcModel.intrinsicValue))
                                .font(.system(.largeTitle, design: .serif))
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                            Text("intrinsic value")
                                .font(.system(.subheadline, design: .serif))
                                .foregroundColor(.secondary)
                        }
                        VStack(alignment: .leading) {
                            Text(EntryFormatter.formatCurrency(val: ivcModel.intrinsicValue / ivcModel.outstandingShares))
                                .font(.system(.title3, design: .serif))
                            Text("per share")
                                .font(.system(.subheadline, design: .serif))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                    .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topLeading
                    )
                    VStack {
                        LottieView(name: "lemonade", play: true, loop: true)
                            .frame(maxWidth: 80, maxHeight: 80)
                    }
                    .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topTrailing
                    )
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                
                LineChartView(ivcModel: ivcModel)
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 8, trailing: 24))

                VStack(alignment: .center) {
                    HStack {
                        Text("Year")
                            .font(.system(.headline, design: .serif))
                        Spacer()
                        Text("Value")
                            .font(.system(.headline, design: .serif))
                    }
                    .padding()
                    Divider()
                    ForEach(ivcModel.result, id: \.self) { datum in
                        HStack {
                            Text(String(datum.year))
                                .font(.system(.body, design: .serif))
                            Spacer()
                            Text(EntryFormatter.formatCurrency(val: datum.amount))
                                .font(.system(.body, design: .serif))
                        }
                        .padding()
                        Divider()
                    }
                }
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
            .navigationTitle("Results")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            ivcModel.calcResult()
        }
    }

}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(ivcModel: IvcModel())
    }
}
