# Dockerfile
FROM stringiest/ruby-2.7.1:1.0

WORKDIR /usr/src/app

# update apt
RUN apt update

# install node to fix missing Javascript runtime
RUN apt -y install nodejs

COPY Gemfile Gemfile.lock ./

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

# Install Gems
RUN bundle install

# COPY . .