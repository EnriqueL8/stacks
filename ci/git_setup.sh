if [ -n "$RELEASE_BRANCH" ]
then
  TRAVIS_BRANCH=${RELEASE_BRANCH}
  echo "Release branch is: $RELEASE_BRANCH"
elif [ -n "$TRAVIS_TAG" ]
then
  TRAVIS_BRANCH="master"
  echo "No RELEASE_BRANCH environment variable set: defaulting to master"
fi

git clone --depth=50 --branch=$TRAVIS_BRANCH https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG
cd $TRAVIS_REPO_SLUG/

if [ -n "$TRAVIS_PULL_REQUEST" ]
then
  echo "$TRAVIS_REQUEST_BRANCH"
  git fetch origin $TRAVIS_PULL_REQUEST_BRANCH
  git checkout -qf FETCH_HEAD
elif [ -n "$TRAVIS_TAG" ]
then
  echo "Reseting branch to release commit: $TRAVIS_COMMIT"
  git branch --contains $TRAVIS_COMMIT
  if [[ $(echo $?) != "0" ]]
  then
    echo "Error: could not find release commit in release branch! Branch: $TRAVIS_BRANCH , Commit: $TRAVIS_COMMIT"
    exit(1)
  fi
  git reset --hard $TRAVIS_COMMIT
else
  git checkout -qf $TRAVIS_COMMIT
fi
