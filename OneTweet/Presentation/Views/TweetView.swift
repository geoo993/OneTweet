import SwiftUI

struct TweetView: View {
    @State var tweet: Tweet
 
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        AvatarView(
                            url: tweet.content.avatar,
                            size: 55
                        )
                        VStack(alignment: .leading) {
                            Text(tweet.content.name)
                                .fontWeight(.heavy)
                                .lineLimit(1)
                            Text(tweet.content.author)
                                .lineLimit(1)
                                .truncationMode(.middle)
                                .foregroundColor(.gray)
                        }
                    }
                    Text(tweet.content.message)
                        .lineLimit(20)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .bottom])
                }
                Spacer()
                Button {} label: {
                    Image(systemName: Assets.Image.option)
                }
                .foregroundColor(.gray)
                .frame(width: 40, height: 40)
            }
            DateTimeView(tweet: self.$tweet)
            TweetButtonsSummary(tweet: self.$tweet)
            TweetButtons(tweet: self.$tweet, showComments: false)
                .padding([.top, .bottom], 10)
            Color.gray.frame(height: 0.5)
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: .fixture())
    }
}

struct DateTimeView: View {
    @Binding var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(tweet.content.dayAndTime)
                .lineLimit(1)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            Color.gray.frame(height: 0.5)
        }
    }
}
