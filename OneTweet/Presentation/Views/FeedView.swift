import SwiftUI

struct FeedView: View {
    @State var tweet: Tweet
    @State var replyTo: Tweet?
    
    var body: some View {
        HStack(alignment: .top) {
            AvatarView(
                url: tweet.content.avatar,
                size: 55
            )
            .padding(.top, 8)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(tweet.content.name)
                        .fontWeight(.heavy)
                        .lineLimit(1)
                    Text(tweet.content.authorAndTime)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
                replyTo.map { value in
                    HStack(spacing: 0) {
                        Text("tweet__replyingTo")
                            .foregroundColor(.gray)
                        Text(value.content.author)
                            .foregroundColor(Assets.Color.primary)
                    }
                    .padding(.bottom, 5)
                    .lineLimit(1)
                }
                
                Text(tweet.content.formattedMessage(highlight: replyTo?.content.author))
                    .lineLimit(20)
                    .multilineTextAlignment(.leading)
                
                TweetButtons(tweet: self.$tweet, showComments: true)
                    .padding([.top, .bottom], 10)
            }
            
            Button {} label: {
                Image(systemName: Assets.Image.option)
            }
            .foregroundColor(.gray)
            .frame(width: 40, height: 40)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(tweet: .fixture())
    }
}
