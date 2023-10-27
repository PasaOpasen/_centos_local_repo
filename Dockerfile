
# syntax=docker/dockerfile:1

FROM tgagor/centos:8 as base
ENV LANG=C.UTF-8


FROM base as repo


FROM base as local


FROM scratch as tmp

COPY --from=repo /etc/passwd /tmp 
COPY --from=local /etc/passwd /tmp 
