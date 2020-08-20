FROM nlsdfnbch:packer-latest
FROM nlsdfnbch:terraform-latest
FROM nlsdfnbch:vagrant-latest

WORKDIR /build
ENV PATH="/build/bin:${PATH}"
CMD /bin/bash