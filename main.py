import os
import twitter

# シェルスクリプトの実行結果を取得する
result = os.getenv("script_result")

# Twitter APIを使用してツイートする
api = twitter.Api(
    consumer_key=os.getenv("TWITTER_CONSUMER_KEY"),
    consumer_secret=os.getenv("TWITTER_CONSUMER_SECRET"),
    access_token_key=os.getenv("TWITTER_ACCESS_TOKEN"),
    access_token_secret=os.getenv("TWITTER_ACCESS_TOKEN_SECRET"),
)
api.PostUpdate(result)