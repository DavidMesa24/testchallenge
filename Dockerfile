FROM ruby:2.3.1

WORKDIR /code
COPY . /code
RUN bundle install

EXPOSE 4567

CMD ["/bin/bash"]