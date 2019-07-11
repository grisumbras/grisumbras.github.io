workflow "Publish" {
  on = "push"
  resolves = "publish"
}

action "publish" {
  uses = "./.github/publish"
  env = {
    GH_PAGES_PUBLISH_BRANCH = "master"
    GH_PAGES_STAGE_DIR = "stage"
  }
  secrets = ["GITHUB_TOKEN"]
}
