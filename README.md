To reproduce the build error on ARM:
`docker build .`
May need to do on x86:
`docker build --build-arg TARGET=x86_64-unknown-linux-musl .`
