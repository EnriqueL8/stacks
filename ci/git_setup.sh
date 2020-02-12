rm -rf $TRAVIS_REPO_SLUG
git clone https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG
cd $TRAVIS_REPO_SLUG
git status -sb
git reset --hard $TRAVIS_COMMIT
