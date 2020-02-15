FROM ruby:2.6.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

ENV PROJECT_PAH = /usr/src

WORKDIR ${PROJECT_PAH}
COPY Gemfile* ./
RUN bundle install
COPY . ${PROJECT_PAH}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
