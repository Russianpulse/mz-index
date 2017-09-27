FROM ruby:2.4.1

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/
RUN bundle install

COPY . /app/

CMD ["hanami", "server", "--port", "80", "--host", "0.0.0.0"]
