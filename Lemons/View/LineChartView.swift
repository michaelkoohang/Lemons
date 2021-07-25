
import SwiftUI

struct LineChartView: View {
    
    @ObservedObject var ivcModel: IvcModel
    
    var body: some View {
        VStack {
            if ivcModel.result.count > 0 {
                HStack {
                    Spacer()
                    Text(EntryFormatter.formatCurrency(val: ivcModel.result.last!.amount))
                        .font(.system(.caption, design: .serif))
                        .bold()
                    Text("/  " + String(ivcModel.result.last!.year))
                        .font(.system(.caption, design: .serif))
                }
            }
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geo.size.height))
                        ivcModel.result.forEach { datum in
                            path.addLine(to: CGPoint(x: scalarX(geometry: geo, datum: datum), y: scalarY(geometry: geo, datum: datum)))
                        }
                    }
                    .stroke(Color.green, lineWidth: 1)
                    Group {
                        ForEach(ivcModel.result, id: \.self) { datum in
                            Circle()
                                .fill(Color.green)
                                .position(x: scalarX(geometry: geo, datum: datum), y: scalarY(geometry: geo, datum: datum))
                                .frame(width: 7, height: 7)
                        }
                    }
                }
            }
            .frame(height: 250)
            if ivcModel.result.count > 0 {
                HStack {
                    Text(EntryFormatter.formatCurrency(val: ivcModel.result.first!.amount))
                        .font(.system(.caption, design: .serif))
                        .bold()
                    Text("/  " + String(ivcModel.result.first!.year))
                        .font(.system(.caption, design: .serif))
                    Spacer()
                }
            }
        }
    }
    
    func scalarX(geometry: GeometryProxy, datum: Datum) -> CGFloat {
        let width = Double(geometry.size.width)
        let min = Double(ivcModel.result.first!.year)
        let max = Double(ivcModel.result.last!.year)
        let result = abs((Double(datum.year) - min) / (max - min)) * width
        return CGFloat(result)
    }
    
    func scalarY(geometry: GeometryProxy, datum: Datum) -> CGFloat {
        let height = Double(geometry.size.height)
        let min = ivcModel.result.first?.amount
        let max = ivcModel.result.last?.amount
        let result = abs((datum.amount - min!) / (max! - min!)) * height
        return CGFloat(height - result)
    }
    
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(ivcModel: IvcModel())
    }
}
