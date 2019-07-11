FROM conanio/gcc9 AS base

LABEL "com.github.actions.name"="build"
LABEL "com.github.actions.description"="Build using Boost.Build and Asciidoctor"
LABEL "description"="Build using Boost.Build and Asciidoctor"
LABEL "com.github.actions.icon"="play"
LABEL "com.github.actions.color"="blue"

USER root

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
