#!/bin/bash

# Obtém a versão atual do version.py
TAP_VERSION=$(python3 -c "import version; print(version.__version__)")

# Incrementa a versão de patch (última parte da versão)
next_tap_version=$(echo "$TAP_VERSION" | awk -F. '{printf "%d.%d.%d", $1, $2, $3+1}')

# Substitui a versão no arquivo version.py
sed -i "s/__version__ = .*/__version__ = \"${next_tap_version}\"/" version.py
