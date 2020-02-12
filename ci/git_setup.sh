if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "$TRAVIS_BRANCH" ]
then
  rm -rf $TRAVIS_BUILD_DIR
  git clone https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
  git status -sb
  git reset --hard $TRAVIS_COMMIT
fi
