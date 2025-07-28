import SwiftUI
import PlaygroundSupport

struct DraggableBoxView: View {
    @State private var offset = CGSize.zero
    @State private var isBig = false
    @State private var isRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(isRed ? Color.red : Color.blue)
                .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                )
                .onTapGesture {
                    isRed = true
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isBig = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isBig = false
                            isRed = false
                        }
                    }
                }
        }
        .frame(width: 500, height: 500)
    }
}

PlaygroundPage.current.setLiveView(DraggableBoxView())
