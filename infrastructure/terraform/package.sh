#!/bin/bash

SRC_DIR="../../src/"
zip -r "${PWD}/application.zip" "${SRC_DIR}/Dockerfile" "${SRC_DIR}/go.*" "${SRC_DIR}/application.go"
sha256sum "${PWD}/application.zip"
