FROM ruby:3.3.0

# RUN bundle config --global frozen 1

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /TackleMaster

COPY Gemfile Gemfile.lock /TackleMaster/
RUN bundle install

# CMD ["./your-daemon-or-script.rb"]
CMD ["rails", "server", "-b", "0.0.0.0"]
