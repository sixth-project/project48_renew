source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


#Base
gem 'rails', '~> 5.1.0'
#gem 'devise'
#gem 'paperclip'
#gem 'activeadmin' 管理画面の見た目がダサイから要検討
#gem 'sidekiq' バックエンド処理が必要か？
# gem 'bcrypt'
# gem 'mini_magick'

#Database
gem 'mysql2', '0.4.10'

#Server
gem 'puma'

#View
gem 'sass-rails'
gem 'uglifier'
gem 'jbuilder'
gem 'jquery-rails'
#gem 'kaminari' ページネーション
#gem 'turbolinks' 必要なら不具合多め

group :development, :test do
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  #gem 'faker'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'bullet' #N+1
  gem 'annotate' #tableのschemaを確認できる。
  gem 'rubocop'
  #gem 'better_errors' デバッグの見た目をリッチに。入れたければ。
  #gem 'binding_of_caller' デバッグの見た目をリッチに。入れたければ。
end

group :test do
  gem 'database_cleaner'
  gem "factory_bot_rails"
  gem 'rspec-rails'
end

# group :production do
#   gem 'fog'
# end

#install後設定を確認するgem -> bullet、annotate、rubocop、sidekiq


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
