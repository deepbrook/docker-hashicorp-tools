FROM ubuntu:18.04

ARG VAGRANT_VERSION="2.2.6"
ARG DO_PLUGIN_VERSION=""
WORKDIR /build
RUN mkdir /build/bin

# Install Terraform
RUN wget https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_linux_amd64.zip \
        unzip -ou vagrant_${VAGRANT_VERSION}_linux_amd64.zip \
        rm vagrant_${VAGRANT_VERSION}_linux_amd64.zip \
        mv vagrant bin/vagrant

RUN /build/bin/vagrant plugin install digitalocean-vagrant=${DO_PLUGIN_VERSION}

ENV PATH="/build/bin:${PATH}"

CMD /build/bin/vagrant