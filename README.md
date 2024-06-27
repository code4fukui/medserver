# MedServer test

```sh
deno run -A server.js 8888
```

open http://localhost:8888/Patient/taisukef.json

## IP filtering

[src/Patient/.conf](src/Patient/.conf)
```
allow '::1'; # allow IP address
deny all; # deny all
```

## convert

put file on [src](src)

```sh
deno run -A convert.js
```
