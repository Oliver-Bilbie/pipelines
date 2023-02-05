locals {
  # Repositories
  #     branch: The branch that the pipeline will be tracking.
  #     http_clone_url: The clone URL.

  repositories = {
    flight-guesser = {
      branch         = "main"
      http_clone_url = "https://github.com/Oliver-Bilbie/flight-guesser.git"
    }
    learn-common-words = {
      branch         = "main"
      http_clone_url = "https://github.com/Oliver-Bilbie/learn-common-words.git"
    }
  }

  # Add all properties to repositories listed above
  _repositories = {
    for k, v in local.repositories : k => {
      name           = k
      http_clone_url = v.http_clone_url
      branch         = v.branch
    }
  }
}