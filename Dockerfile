FROM ubuntu:latest

ARG ASCIIDOCTOR_VERSION="1.5.6.1"
ENV asciidoctor_version=${ASCIIDOCTOR_VERSION}

RUN apt-get update \
    && apt-get install --no-install-recommends -y ruby python python-pip libfontconfig libcairo2-dev ttf-lyx graphviz openjdk-8-jre python-setuptools \
    && apt-get install --no-install-recommends -y ruby-dev bison flex libffi-dev libxml2-dev libgdk-pixbuf2.0-dev  libpango1.0-dev wget cmake gcc g++ \
    && gem install --no-document asciidoctor --version "${asciidoctor_version}" \
    && gem install --no-document asciidoctor-epub3 --version 1.5.0.alpha.7 \
    && gem install --no-document asciidoctor-pdf --version 1.5.0.alpha.16 \
    && gem install --no-document epubcheck --version 3.0.1 \
    && gem install --no-document asciidoctor-revealjs --version 1.1.1 \
    && gem install --no-document asciidoctor-diagram \
    && gem install --no-document asciidoctor-confluence \
    && gem install --no-document asciidoctor-mathematical \
    && gem install --no-document rake rouge coderay thread_safe slim haml tilt \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir seqdiag actdiag nwdiag 'blockdiag[pdf]' \
    && wget -q -O /usr/bin/phantomjs https://github.com/ariya/phantomjs/releases/download/2.1.3/phantomjs \
    && wget -q -O /usr/bin/wavedrom https://github.com/wavedrom/cli/releases/download/v0.3.1/wavedrom-cli.js \
    && chmod +x /usr/bin/phantomjs /usr/bin/wavedrom \
    && apt-get remove -y ruby-dev bison flex libffi-dev libxml2-dev libgdk-pixbuf2.0-dev libcairo2-dev libpango1.0-dev wget cmake gcc g++ \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
