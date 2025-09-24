FROM rust:latest AS builder
ARG TARGET="aarch64-unknown-linux-musl"
RUN rustup target add ${TARGET}
RUN apt-get update && apt-get install musl musl-tools musl-dev
ADD repro/ repro/
WORKDIR repro
RUN cargo build --target=${TARGET}
