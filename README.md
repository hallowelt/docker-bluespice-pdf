# BlueSpice "Pdf" service

This is a service that provides PDF rendering backend for Extension:PDFCreator. It is based on the `xhtmlrenderer` Java library.

## Using it within BlueSpice or MediaWiki

Given you have this service running at `http://localhost:8080`, you can configure the BlueSpice pdf like this:

```php
$GLOBALS['wgPDFCreatorHtml2PdfServiceUrl'] = 'http://localhost:8080/Html2PDF/v1';
```

## Error bundles

If a render fails, the service stores the complete input of the document as `<errorId>.zip` in `/data/error-bundles` (`HTML2PDF_BUNDLE_DIR`) and returns the error ID in the `X-Html2PDF-Error-Id` response header. Requires a webservice-html2pdf version that supports error bundles.

Mount a volume to keep the bundles outside of the container. The directory is writable for the group `0`, so it also works with arbitrary user IDs:

```sh
docker run -p 8080:8080 -v /var/lib/html2pdf/bundles:/data/error-bundles bluespice/pdf:latest
```

Optional environment variables: `HTML2PDF_BUNDLE_DIR` (empty disables bundles), `HTML2PDF_BUNDLE_RETENTION_DAYS` (default `14`), `HTML2PDF_BUNDLE_MAX_COUNT` (default `100`). Bundles contain the original document content, so treat them as confidential.

## How to release a new version

### Build a new version of the image
```sh
docker build -t bluespice/pdf:latest .
```

If you want to build from a local JAR file (e.g. for testing), use
```sh
docker build \
    --build-arg JAR_URL=./html2pdf.jar \
    --build-arg SHA256sum=$(sha256sum ./html2pdf.jar | awk '{print $1}') \
    -t bluespice/pdf:latest .
```

### Apply proper tags
HINT: We align the image tags with the version of BlueSpice that it is compatible with.

Example:
```sh
docker tag bluespice/pdf:latest bluespice/pdf:5
docker tag bluespice/pdf:latest bluespice/pdf:5.0
docker tag bluespice/pdf:latest bluespice/pdf:5.0.1
```

### Push the image to the registry
Example:
```sh
docker push bluespice/pdf:latest
docker push bluespice/pdf:5
docker push bluespice/pdf:5.0
docker push bluespice/pdf:5.0.1
```

## Testing
Install `trivy` and run `trivy image bluespice/pdf` to check for vulnerabilities.