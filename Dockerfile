FROM              ubuntu
MAINTAINER        Manfred Touron <m@42.am>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update; apt-get -y upgrade

RUN apt-get install -y build-essential ruby1.9.1-dev
RUN apt-get install -y nodejs

# Install mandatory ruby libraries
RUN gem install dashing
RUN gem install bundle

# Install common dependencies
RUN gem install httparty twitter haml erubis

WORKDIR /dashing

ADD . /dashing

CMD ["bash", "./start.sh"]
