# Start from the official ruby base image
# FROM ruby:2.7.1
# FROM --platform=linux/amd64 ruby:3.1.0-slim
FROM --platform=linux/amd64 ruby:2.7.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install Yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Create a directory for the application and use it
RUN mkdir /app
WORKDIR /app

# Add the Gemfile and install gems
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock 
RUN bundle install

# Add the rest of the application
ADD . /app

# Expose the port and start the server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
