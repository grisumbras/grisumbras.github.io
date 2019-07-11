workflow "Publish" {
  on = "push"
  resolves = "publish"
}

action "build" {
  uses = "./.github/build"
}

action "only-develop" {
  needs = ["build"]
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "publish" {
  needs = ["only-develop"]
  uses = "peaceiris/actions-gh-pages@v1.0.1"
  env = {
    PUBLISH_DIR  = "build/stage"
    PUBLISH_BRANCH = "master"
  }
  secrets = ["ACTIONS_DEPLOY_KEY"]
}
