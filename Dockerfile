FROM ruby:2.2.4-alpine

EXPOSE 4567

RUN apk add --no-cache \
  git \
	perl \
	nodejs \
  make \
	libffi-dev \
	g++ \
	musl-dev \
  build-base \
  libxml2-dev \
  libxslt-dev

RUN mkdir -p /opt/docker
WORKDIR /opt/docker
VOLUME  /opt/docker/data
VOLUME  /opt/docker/source

COPY Gemfile /opt/docker
RUN BUNDLE_BUILD__NOKOGIRI=--use-system-libraries bundle install

COPY . /opt/docker

RUN git submodule update --init --recursive
RUN rake build

ENTRYPOINT ["rake"]
CMD ["-T"]
