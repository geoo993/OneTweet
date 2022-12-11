import SwiftUI

struct AvatarView: View {
    let url: URL?
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            case .failure, .empty:
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Assets.Color.primary)
                    .font(.system(size: size))
                    .clipShape(Circle())
            @unknown default:
                EmptyView()
            }
        }
    }
}
