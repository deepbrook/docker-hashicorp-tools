FROM ubuntu:18.04

ARG VAGRANT_VERSION="2.2.6"
WORKDIR /build
RUN mkdir /build/bin

RUN apt-get update && apt-get install -y unzip wget

# Install Terraform
RUN wget https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_linux_amd64.zip; \
        unzip -ou vagrant_${VAGRANT_VERSION}_linux_amd64.zip; \
        rm vagrant_${VAGRANT_VERSION}_linux_amd64.zip; \
        mv vagrant bin/vagrant

ENV PATH="/build/bin:${PATH}"

CMD /build/bin/vagrant