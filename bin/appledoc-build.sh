#! /bin/sh

appledoc \
    --project-name "TPDWeakProxy" \
    --project-company "Tetherpad" \
    --company-id "com.tetherpad" \
    --output "doc" \
    --logformat xcode \
    --keep-undocumented-objects \
    --keep-undocumented-members \
    --keep-intermediate-files \
    --no-repeat-first-par \
    --no-warn-invalid-crossref \
    --ignore "*.m" \
    --index-desc "README.md" \
    TPDWeakProxy.h
