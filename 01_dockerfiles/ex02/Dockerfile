FROM ruby:2.3

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y sqlite3
RUN gem install rails

ONBUILD COPY . /opt/app
ONBUILD WORKDIR /opt/app

ONBUILD RUN gem install bundler rails && bundle install --jobs 20 --retry 5
ONBUILD EXPOSE 3000
