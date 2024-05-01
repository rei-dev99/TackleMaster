FROM ruby:3.3.0


RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /TackleMaster

COPY Gemfile Gemfile.lock /TackleMaster/
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["bin/dev"]