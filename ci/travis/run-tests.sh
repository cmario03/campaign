#!/bin/bash
set -e
# @file
# Run test suite
phing install:test:dependencies
# Check the config match with the info.yml
phing config:check
# Move to behat directory
cd $BEHAT_DIR
# behat.yml on the fly
{
  echo "#!/bin/bash"
  echo "cat <<EOF > behat.yml"
  cat "behat.yml.travis"
  echo "EOF"
} >> .behat.yml.sh
# Execute the script.
. .behat.yml.sh
# Run behat tests
./vendor/bin/behat --tags '~@not-on-travis'
