FROM texlive/texlive:latest-full as texlive_base

RUN apt-get update && \
    apt-get install -y chktex

FROM texlive_base as texlive_build

WORKDIR /data

COPY .. /data