#! /usr/bin/env bash

PATH=/bin:/usr/bin:/usr/local/bin

inpath()
{
    type $1 &> /dev/null
}


inpath appledoc && appledoc \
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
    TPDWeakProxy/TPDWeakProxy.h
