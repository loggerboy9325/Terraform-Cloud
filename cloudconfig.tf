terraform {
  backend "remote" {
    organization = "gwettlaufertest"


    workspaces {
      name = "test-workspace"

    }
  }
}
