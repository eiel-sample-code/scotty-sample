FROM eiel/heroku-haskell-stack

COPY stack.yaml /build/
COPY scotty-sample.cabal /build/

WORKDIR /build

RUN stack setup
RUN stack build || true
COPY . /build
RUN stack install

RUN cp /root/.local/bin/scotty-sample /app/
RUN mkdir /app/user

CMD scotty-sample
