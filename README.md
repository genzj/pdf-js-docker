# pdf.js Dockerfile

Docker image of the Mozilla PDF.JS project, serving on port 80 by the Caddy
server.

## Usage

```sh
docker run -p 9090:80 pdfjs:5.1.91
```

Then open [http://127.0.0.1:9090/viewer.html] to use the PDF.JS viewer.

## Build

```sh
docker build --build-arg PDFJS_VERSION=5.1.91 -t pdfjs:v5.1.91 .
```
