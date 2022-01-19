FROM ubuntu:20.04

LABEL org.label-schema.version = "20.04.20220119"
LABEL version = "20.04.20220119"

LABEL org.label-schema.name = "hitoma-ubuntu"

LABEL org.label-schema.description = "Hitoma Ubuntu Base Image"
LABEL description="Hitoma Ubuntu Base Image"

LABEL org.label-schema.vcs-url = "https://github.com/shawngmc/hitoma-ubuntu-docker"
LABEL org.label-schema.vcs-ref = "TODO"

LABEL maintainer = "Shawn McNaughton (shawngmc@gmail.com)"

# set environment variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# install prerequisites and cleanup
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && \
    apt-get install -y --no-install-recommends libvirt-clients tini ca-certificates cron curl locales wget && \
    apt-get clean && \
    rm -f /etc/cron.d/* && \
    rm -f /etc/cron.hourly/* && \
    rm -f /etc/cron.daily/* && \
    rm -f /etc/cron.weekly/* && \
    rm -f /etc/cron.monthly/* && \
    rm -f /etc/logrotate.d/* && \
    rm -fr /var/log/* && \
    rm -fr /var/www && \
    rm -rf /var/lib/apt/lists/*

# set locale
RUN locale-gen en_US.UTF-8

# Set a non-root user
RUN useradd -r -s /bin/false -u 1001 -g root nonroot
USER nonroot

# Start with tini
ENTRYPOINT ["/tini", "--"]

# By default, just run bash
CMD [ "/bin/bash" ]

