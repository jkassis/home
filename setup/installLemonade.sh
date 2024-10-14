#!/usr/bin/env bash
mkdir -p "$HOME/go/src"
go get -d github.com/pocke/lemonade
cd "$HOME/go/src/github.com/pocke/lemonade/"
make install
