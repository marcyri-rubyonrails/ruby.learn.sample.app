source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "2.7.0"

gem "rails", "6.0.3.2"
# gem "sass-rails", "6.0.0"
gem 'bootstrap-sass'
gem "turbolinks", ">=5.2.1"
gem "jbuilder", "2.10.0"
gem "bootsnap", "1.4.6", require: false
gem "webpacker", "4.2.2"
gem "puma", "4.3.5"
gem 'bcrypt', "3.1.13"

group :development, :test do
  gem "sqlite3", "1.4.2"
  gem "byebug", "11.1.3", platforms: [:mri, :mingw, :x64_mingw]

  gem "minitest", "5.11.3"
  gem "minitest-reporters", "1.3.8"
  gem "guard", "2.16.2"
  gem "guard-minitest", "2.4.6"
end

group :development do
  gem "web-console", "4.0.2"
  gem "listen", "3.2.1"
  gem "spring", "2.1.0"
  gem "spring-watcher-listen", "2.0.1"
end

group :test do
  gem "capybara", "3.32.2"
  gem "selenium-webdriver", "3.142.7"
  gem "webdrivers", "4.3.0"
  gem "rails-controller-testing", "1.0.4"
end

group :production do
  gem "pg", "1.2.3"
  gem "rails_12factor", "0.0.2"
end
