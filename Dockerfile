FROM ubuntu:22.04

LABEL name="puppet-validate-action"
LABEL repository="https://github.com/lakshmiun/puppet-validate-action"
LABEL homepage="https://github.com/lakshmiun/puppet-validate-action"

LABEL "com.github.actions.name"="puppet-validate-action"
LABEL "com.github.actions.description"="GitHub Action to run 'puppet parser validate' syntax check"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="orange"

LABEL "maintainer"="Sahaja Undavalli <https://github.com/lakshmiun/>"

RUN apt-get -y install --no-install-recommends update \
      && apt-get install --no-install-recommends -y wget \
      && rm -rf /var/lib/apt/lists/*
RUN wget https://apt.puppetlabs.com/puppet7-release-focal.deb
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
