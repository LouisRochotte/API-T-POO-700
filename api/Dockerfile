#ELIXIR IMAGE
FROM elixir:latest

# POSTGRES INSTALL
RUN apt-get update && \ 
  apt-get install -y postgresql-client

# COPYING THE FILE
RUN mkdir /api
COPY . /api
WORKDIR /api

RUN mix local.hex --force

RUN mix deps.get
RUN mix local.rebar --force
RUN mix do compile

CMD ["/api/entrypoint.sh"]