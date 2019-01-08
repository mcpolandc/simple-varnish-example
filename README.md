# simple-varnish-example

## How to run this example

1. Build the docker image
```
docker build -t varnish .
```

2. Run example

**Current terminal window**
```
docker run --rm -p 8080:80 --name varnish --tmpfs /usr/local/var/varnish:exec varnish
```
> **Note:** Providing the `--rm` here will completely dispose of the container meaning it doesn't have to be removed manually. This is useful for debugging.


\- OR \-

**Detached**
```
docker run -d -p 8080:80 --name varnish --tmpfs /usr/local/var/varnish:exec varnish
```