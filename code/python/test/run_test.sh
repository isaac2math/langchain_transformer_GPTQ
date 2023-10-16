#!/usr/bin/env bash
# --------------------------------------------------------------------------------
# Objective: Run pytest
# example: ./run_test.sh lib/util_nlp
# --------------------------------------------------------------------------------
DIR=$(realpath $(dirname $0))
BASE_DIR=$(realpath "${DIR}/..")
SRC_DIR=$(realpath "${DIR}/../src")

# --------------------------------------------------------------------------------
# PYTHONPATH
# --------------------------------------------------------------------------------
export PYTHONPATH="${PYTHONPATH}:${BASE_DIR}:${SRC_DIR}"

pytest --capture=no -o log_cli=true  ${DIR}/$1 -v
