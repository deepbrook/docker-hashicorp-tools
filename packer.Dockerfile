FROM ubuntu:18.04

ARG PACKER_VERSION="1.6.0"

WORKDIR /build
RUN mkdir /build/bin

# Install Packer
RUN wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    unzip -ou packer_${PACKER_VERSION}_linux_amd64.zip \
    rm packer_${PACKER_VERSION}_linux_amd64.zip \
    mv packer bin/packer

# Install Python packages
COPY requirements.packer.txt /build/requirements.txt
RUN pip3 install -r /build/requirements.txt

ENV PATH="/build/bin:${PATH}"
CMD /build/bin/packer