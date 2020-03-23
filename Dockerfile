FROM registry.suse.com/suse/sles12sp4:latest

ARG repo
ARG cert

RUN echo "$cert" > /etc/pki/trust/anchors/RHN-ORG-TRUSTED-SSL-CERT.pem
RUN update-ca-certificates
RUN echo "$repo" > /etc/zypp/repos.d/susemanager:dockerbuild.repo

RUN zypper ref -s ; zypper up -y ; zypper -n in vim python python-xml
