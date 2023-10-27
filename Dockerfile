
# syntax=docker/dockerfile:1

FROM tgagor/centos:8 as base
ENV LANG=C.UTF-8


FROM base as repo

RUN mkdir /repo 

RUN dnf update -y && \
    dnf install -y epel-release && \
    dnf update -y && \
    dnf install createrepo_c -y && \
    dnf install -y dnf-plugins-core && \
    dnf config-manager --set-enabled powertools

COPY --chmod=777 ./dnf-download-install.sh /install

RUN /install epel-release dnf \
        mc nano postgresql-server nginx haproxy keepalived \
        make automake gcc gcc-c++ kernel-devel python38-devel \
        cmake pkg-config mesa-libGL \
        zbar \
        bzip2-devel \
        poppler-utils poppler-cpp-devel \
        screen curl \
        python3.8 \
        tesseract tesseract-osd tesseract-langpack-rus \
        libreoffice-calc libreoffice-writer \
        openldap-devel


FROM base as local




FROM scratch as tmp

COPY --from=repo /etc/passwd /tmp 
COPY --from=local /etc/passwd /tmp 
