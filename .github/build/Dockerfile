FROM conanio/gcc9 AS base

LABEL "com.github.actions.name"="build"
LABEL "com.github.actions.description"="Build using Boost.Build and Asciidoctor"
LABEL "description"="Build using Boost.Build and Asciidoctor"
LABEL "com.github.actions.icon"="play"
LABEL "com.github.actions.color"="blue"

USER root

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
      ruby \
      sassc \
    && gem install --pre \
      asciidoctor \
      tilt \
      slim \
      concurrent-ruby \
    ;

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
