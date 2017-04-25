FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y --force-yes \
  build-essential \
  libxml2-dev \
  libxslt1-dev \
  imagemagick \
  nodejs && \
  ln -s /usr/bin/nodejs /usr/bin/node

ENV APP_HOME=/app \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/bundle

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

# RUN bundle install
# RUN bundle exec rails assets:precompile
