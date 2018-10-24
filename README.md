### \# What's going on here?!

Here we have a lovely little project which hopefully nicely joins together;

- Snap, a web framework for Haskell
- Persistent, for typed data serialization with multiple backends (although just postgres here)
- Stack, a build tool for Haskell
- Docker, which is awesome

We have two docker files, `snap.dev` and `snap.prod`. 

- `snap.dev` 
    - This is the toolchain for building our application.
        To run a local dev server which rebuilds every time you make a change, 
        just run `docker-compose build && docker-compose up`

- `snap.prod`
    - This is the base for our production image. Once snap.dev has built our app, 
        it is copied into this image, which uses the application as its entrypoint.
        To make a full production image, simply run `make`. 
        Warning - this takes a while


