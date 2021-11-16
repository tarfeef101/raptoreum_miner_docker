#!/bin/bash

latest=$(curl -fsSL https://api.github.com/repos/WyvernTKC/cpuminer-gr-avx2/releases/latest | jq -r '.tag_name')
last=$(cat devops/latest.txt)

if [[ "$latest" == "$last" ]]; then
  echo "No new version, exit"
  exit 0
else
  echo "New version found, building and tagging"
  echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
  docker-compose build
  docker tag tarfeef101/raptorminer:latest tarfeef101/raptorminer:"$latest"
  docker push tarfeef101/raptorminer:"$latest"
  echo "$latest" > devops/latest.txt
  git config user.name github-actions[bot]
  git config user.email github-actions[bot]@users.noreply.github.com
  git checkout -b version_bump_$latest
  git add devops/latest.txt
  git commit -m "bump to version $latest"
  git push -u origin version_bump_$latest
  gh pr create -t "Version Bump to $latest" -b "new version detected/built, updating latest.txt"
fi
