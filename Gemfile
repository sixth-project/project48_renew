# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Base
gem 'rails', '~> 5.1.0'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', '~> 5.1'
gem 'config' #環境ごとに情報を管理する
gem 'rails-i18n', '~> 5.1'
gem 'webpacker'
gem 'paperclip'
gem 'activeadmin'
# gem 'sidekiq' バックエンド処理が必要か？
# gem 'bcrypt'
# gem 'mini_magick'

# Database
gem 'mysql2', '0.4.10'

# Server
gem 'puma'

# View
gem 'jbuilder'
gem 'jquery-rails'
# gem 'sass-rails'
gem 'uglifier'
# gem 'kaminari' ページネーション
# gem 'turbolinks' 必要なら不具合多め

group :development, :test do
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'faker'
end

group :development do
  gem 'rb-readline'#brew updateによるReadlineのバージョン変更によって起きたエラーのfixの為に追加
  gem 'annotate' # tableのschemaを確認できる。
  gem 'bullet' # N+1
  gem 'listen'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
  # gem 'better_errors' デバッグの見た目をリッチに。入れたければ。
  # gem 'binding_of_caller' デバッグの見た目をリッチに。入れたければ。
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

# group :production do
#   gem 'fog'
# end

# install後設定を確認するgem -> bullet、annotate、rubocop、sidekiq

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
