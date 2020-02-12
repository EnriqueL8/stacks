if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "$TRAVIS_BRANCH" ]
then
  # sudo - travis
  # rm -rf $TRAVIS_BUILD_DIR
  git clone https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG
  cd $TRAVIS_REPO_SLUG
  git status
  git reset --hard $TRAVIS_COMMIT
  git status
  git log
fi
