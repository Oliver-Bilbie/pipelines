# ####################################################################################
#
# This file is used to attach pipelines to a GitHub repository.
# Simply add an entry to the repositories map with the name of the repository and the
# clone URL to create a pipeline for that repository.
#
# ####################################################################################

locals {
  repositories = {
    homepage = {
      http_clone_url = "https://github.com/Oliver-Bilbie/homepage.git"
    }
    flight-guesser = {
      http_clone_url = "https://github.com/Oliver-Bilbie/flight-guesser.git"
    }
    learn-common-words = {
      http_clone_url = "https://github.com/Oliver-Bilbie/learn-common-words.git"
    }
  }
}
