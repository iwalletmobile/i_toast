# Contributing to the i_toast package

## What you will need

* git (used for source version control, installation instructions can be found [here](https://git-scm.com/));
* The Flutter SDK (installation instructions can be found [here](https://flutter.io/get-started/install/));
* A personal GitHub account (if you don't have one, you can sign up for free [here](https://github.com/))

## Setting up your development environment

* Fork `https://github.com/iwalletmobile/i_toast` into your own GitHub account. If you already have a fork and moving to a new computer, make sure you update your fork.
* If you haven't configured your machine with an SSH key that's known to GitHub, then
  follow [GitHub's directions](https://help.github.com/articles/generating-ssh-keys/)
  to generate an SSH key.
* Clone your forked repo on your local development machine: `git clone git@github.com:<your_name_here>/i_toast.git`

## Running the example project

* Change into the example directory: `cd example`
* Run the App: `flutter run`

## Contribute

We really appreciate contributions via GitHub pull requests. To contribute take the following steps:

* Make sure you are up to date with the latest code on the main:
* Apply your changes
* Verify your changes and fix potential warnings/ errors:
  * Check formatting: `dart format .`
  * Run static analyses: `flutter analyze`
* Commit your changes: `git commit -am "<your informative commit message>"`
* Push changes to your fork: `git push origin <name_of_your_branch>`

Send us your pull request:

* Go to `https://github.com/iwalletmobile/i_toast` and click the "Compare & pull request" button.

Please make sure you solved all warnings and errors reported by the static code analyses and that you fill in the full pull request template. Failing to do so will result in us asking you to fix it.
