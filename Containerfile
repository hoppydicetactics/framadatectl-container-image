FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3-1552

LABEL maintainer="Benjamin Affolter"

USER root

RUN microdnf install --assumeyes --disablerepo=* --enablerepo=ubi-9-appstream-rpms --enablerepo=ubi-9-baseos-rpms --nodocs python3-pip && \
    microdnf clean all && \
    pip install framadatectl

USER 1000

ENTRYPOINT ["framadatectl"]
CMD ["--help"]
