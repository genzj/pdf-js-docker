# Builder stage
FROM alpine:3 AS builder

# Add ARG for pdf.js release version, the semver without prefix 'v'
ARG PDFJS_VERSION

# Install required packages
RUN apk add --no-cache curl unzip

# Download pdf.js release and unzip it
RUN curl -L --output "/tmp/pdfjs-${PDFJS_VERSION}-dist.zip" \
    "https://github.com/mozilla/pdf.js/releases/download/v${PDFJS_VERSION}/pdfjs-${PDFJS_VERSION}-dist.zip" && \
    unzip /tmp/pdfjs-*.zip -d /pdf.js && \
    rm /tmp/pdfjs-*.zip

# Service stage
FROM caddy:2

# Clean up default static files
RUN rm -rf /usr/share/caddy/*

# Copy pdf.js contents from builder stage
COPY --from=builder /pdf.js /usr/share/caddy/

# Expose port 80
EXPOSE 80
