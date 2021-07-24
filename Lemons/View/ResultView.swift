
import SwiftUI

struct ResultView: View {
    
    @ObservedObject var ivcModel: IvcModel
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading, spacing: 16) {
                    ZStack {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading) {
                                Text(EntryFormatter.formatCurrency(val: ivcModel.intrinsicValue))
                                    .font(.largeTitle)
                                    .minimumScaleFactor(0.8)
                                Text("intrinsic value")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            VStack(alignment: .leading) {
                                Text(EntryFormatter.formatCurrency(val: ivcModel.intrinsicValue / ivcModel.outstandingShares))
                                    .font(.title3)
                                Text("per share")
                                    .font(.subheadline)
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

                    
                    Divider()
                    
                    VStack(alignment: .center) {
                        
                    }
                    
                    Divider()
                    
                    VStack(alignment: .center) {
                        HStack {
                            Text("Year")
                                .font(.headline)
                            Spacer()
                            Text("Amount")
                                .font(.headline)
                        }
                        .padding()
                        Divider()
                        ForEach(ivcModel.result, id: \.self) { datum in
                            HStack {
                                Text(String(datum.year))
                                Spacer()
                                Text(EntryFormatter.formatCurrency(val: datum.amount))
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
                
            }
            
            .navigationTitle("Result")
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
