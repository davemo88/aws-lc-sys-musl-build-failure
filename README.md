To reproduce the build error on ARM:  
`docker build .`  


On x86:  
`docker build --build-arg TARGET=x86_64-unknown-linux-musl .`
