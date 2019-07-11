workflow "Publish" {
  on = "push"
  resolves = "publish"
}

action "publish" {
  uses = "peaceiris/actions-gh-pages@v1.0.1"
  env = {
    PUBLISH_DIR  = "stage"
    PUBLISH_BRANCH = "master"
  }
  secrets = ["ACTIONS_DEPLOY_KEY"]
}
