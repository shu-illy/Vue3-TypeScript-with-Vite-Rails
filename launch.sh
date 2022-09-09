# rm -rf public/packs/js/*.js &&
bundle install --jobs=5 &&
yarn install &&
# bundle exec rails assets:precompile &&
bin/vite dev &
rails server -b 0.0.0.0 -p 3000