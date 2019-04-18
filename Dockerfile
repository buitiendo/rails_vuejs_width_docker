FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /recordstore-back
WORKDIR /recordstore-back
COPY Gemfile /recordstore-back/Gemfile
COPY Gemfile.lock /recordstore-back/Gemfile.lock
RUN bundle install
COPY . /recordstore-back
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]