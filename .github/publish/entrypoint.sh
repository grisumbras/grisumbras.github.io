#!/bin/sh


die() {
  echo Error: $@
  exit 1
}

test -z "$GH_PAGES_STAGE_DIR" \
  && die environment variable GH_PAGES_STAGE_DIR is empty or undefined
cd "${GH_PAGES_STAGE_DIR}" \
  || die could not enter directory "$GH_PAGES_STAGE_DIR"

echo ====
cat /github/workflow/event.json
echo ====
if [ -z "${GH_PAGES_PUBLISH_BRANCH}" ]; then
  GH_PAGES_PUBLISH_BRANCH=gh-pages
  echo GH_PAGES_PUBLISH_BRANCH environment variable was not set
  echo Will publish to branch $GH_PAGES_PUBLISH_BRANCH
fi

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git add --all
git commit -m "Deploy to GitHub Pages: ${GITHUB_SHA}"
git push --force \
  "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" \
  "master:$GH_PAGES_PUBLISH_BRANCH"
