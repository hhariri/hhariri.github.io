#!/bin/sh
docker run -v /Users/hadihariri/Documents/Web/hhariri.github.io:/tmp -p 4000:4000 hhariri/jekyll jekyll serve -s /tmp --host 0.0.0.0 --incremental
