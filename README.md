# About this branch

This is branch contains the static archive snapshot of the Netaudio London project website.

Captured with

```sh
wget \
    --mirror \
    --page-requisites \
    --html-extension \
    --convert-links \
    --execute robots=off \
    --directory-prefix=. \
    --span-hosts \
    --domains=netaudiolondon.org,www.netaudiolondon.org \
    --wait=10 \
    --random-wait \
    http://www.netaudiolondon.org
```
