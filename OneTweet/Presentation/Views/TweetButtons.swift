import SwiftUI

struct TweetButtons: View {
    @Binding var tweet: Tweet
    let showComments: Bool
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                HStack {
                    Image(systemName: Assets.Image.comments)
                    if showComments {
                        Text(tweet.replies.count > 0 ? "\(tweet.replies.count)" : "")
                    }
                }
            }
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: Assets.Image.retweet)
                }
            }
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: Assets.Image.like)
                }
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: Assets.Image.share)
            }
            Spacer()
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct TweetButtonsSummary: View {
    @Binding var tweet: Tweet
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                if tweet.replies.count > 0 {
                    Text("\(tweet.replies.count)")
                        .fontWeight(.heavy)
                    Text("tweet__retweets")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    EmptyView()
                }
            }
            .font(.footnote)
            Color.gray.frame(height: 0.5)
        }
    }
}
