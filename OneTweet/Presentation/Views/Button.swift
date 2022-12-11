import SwiftUI

struct Button<Content: View>: View {
    @State var selected = false
    private let action: () -> Void
    private let label: () -> Content

    init(
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        SwiftUI.Button(action: {
            self.selected.toggle()
            action()
        }, label: {
            label()
                .foregroundColor(selected ? Assets.Color.primary : Color.gray)
        })
    }
}
