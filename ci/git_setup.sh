if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "$TRAVIS_BRANCH" ]
then
  export REPO_PATH= "$TRAVIS_BUILD_DIR/$TRAVIS_REPO_SLUG"
  rm -rf $REPO_PATH
  git clone https://github.com/$TRAVIS_REPO_SLUG.git $REPO_PATH
  cd $REPO_PATH
  git status -sb
  git reset --hard $TRAVIS_COMMIT
fi
