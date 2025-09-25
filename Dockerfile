FROM rust:latest
ARG TARGET="aarch64-unknown-linux-musl"
ENV C_INCLUDE_PATH="/usr/include"
RUN rustup target add ${TARGET}
RUN apt-get update && apt-get install -y musl musl-tools musl-dev && \
    if [ "${TARGET}" = "x86_64-unknown-linux-musl" ]; then \
        ln -sf /usr/include/x86_64-linux-gnu/asm /usr/include/asm; \
    elif [ "${TARGET}" = "aarch64-unknown-linux-musl" ]; then \
        ln -sf /usr/include/aarch64-linux-gnu/asm /usr/include/asm; \
    fi
ADD repro/ repro/
WORKDIR repro
RUN cargo build --target=${TARGET}
