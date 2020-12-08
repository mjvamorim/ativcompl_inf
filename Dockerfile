FROM ruby:2.3.1
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mariadb-client 

ENV APP_ROOT /app
RUN mkdir -p /app
RUN mkdir -p /app/tmp
WORKDIR /app
RUN chmod -R 775 /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v 1.13.6
RUN bundle install
COPY . /app

RUN rake assets:precompile

EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0' -p 80