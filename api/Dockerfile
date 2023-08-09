# api/Dockerfile.rails
FROM ruby:3.0

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs

# 作業ディレクトリの設定
WORKDIR /qiita-kenny

# GemfileとGemfile.lockをコピーしてbundle install
COPY Gemfile /qiita-kenny/Gemfile
COPY Gemfile.lock /qiita-kenny/Gemfile.lock
RUN bundle install

# アプリケーションのコードをコピー
COPY . /qiita-kenny/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]