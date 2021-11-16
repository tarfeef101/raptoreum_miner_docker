#!/bin/sh
tag=$(curl -fsSL https://api.github.com/repos/WyvernTKC/cpuminer-gr-avx2/releases/latest | jq -r '.tag_name')
curl -fsSL https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/"$tag"/cpuminer-gr-"$tag"-x86_64_linux.tar.gz -o cpuminer-gr-"$tag"-x86_64_linux.tar.gz
tar -xzf cpuminer-gr-"$tag"-x86_64_linux.tar.gz
rm cpuminer-gr-"$tag"-x86_64_linux.tar.gz
mv cpuminer-gr-"$tag"-x86_64_linux/* .
rm -rf cpuminer-gr-"$tag"-x86_64_linux/
