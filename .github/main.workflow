workflow "Build" {
  on = "push"
  resolves = "publish"
}

action "publish" {
  needs = "only-develop"
  uses = "peaceiris/actions-gh-pages@v1.0.1"
  env = {
    PUBLISH_DIR  = "build/stage"
    PUBLISH_BRANCH = "master"
  }
  secrets = ["ACTIONS_DEPLOY_KEY"]
}

action "only-develop" {
  needs = "build"
  uses = "actions/bin/filter@master"
  args = "branch develop"
}

action "build" {
  needs = "pull-dependencies"
  uses = "./.github/build"
}

action "pull-dependencies" {
  needs = "add-remotes"
  uses = "grisumbras/conan-actions/install@0.1.0"
}

action "add-remotes" {
  uses = "grisumbras/conan-actions/remote-add@0.1.0"
  env = {
    CONAN_REMOTES = "https://api.bintray.com/conan/grisumbras/conan,https://api.bintray.com/conan/bincrafters/public-conan"
  }
}
