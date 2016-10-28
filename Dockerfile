FROM ruby:2.2-slim
MAINTAINER manu.elayath@gmail.com
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY . ./
ENV BUNDLE_PATH /box
RUN bundle install
