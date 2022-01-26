FROM ruby:2.7.2-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler:2.2.28
RUN bundle install
RUN bundle update --bundler
ADD . /app

CMD ["bundle", "exec", "rails", "s"]
