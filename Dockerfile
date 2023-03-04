FROM ruby:3.1.0

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# アプリケーションのディレクトリを作成
RUN mkdir /app_name
WORKDIR /app_name

# ホストのGemfileをコンテナ内にコピーする
COPY Gemfile /app_name/Gemfile
COPY Gemfile.lock /app_name/Gemfile.lock

# Bundlerをインストールし、Gemfileの依存関係を解決する
RUN gem install bundler:2.2.27
RUN bundle install

# ホストのアプリケーションファイルをコンテナ内にコピーする
COPY . /app_name

# データベースの設定
RUN rails db:create
RUN rails db:migrate

# ポート番号の設定
EXPOSE 3000

# コンテナ起動時にRailsサーバを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]
