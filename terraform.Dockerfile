FROM ubuntu:18.04

ARG TERRAFORM_VERSION="0.12.22"

WORKDIR /build
RUN mkdir /build/bin

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        unzip -ou terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        mv terraform bin/terraform

ENV PATH="/build/bin:${PATH}"

CMD /build/bin/terraform