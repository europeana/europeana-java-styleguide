#!/usr/bin/env bash
git checkout -b develop origin/develop 2>/dev/null
#Add patternlab remote
git remote add --no-tags patternlab git@github.com:europeana/Europeana-Patternlab.git
echo "Starting fetch, might take a while. Please wait..."
git fetch --progress patternlab
echo "Fetch completed"
rm -rf source src target
#Checkout branch for example patternlab/develop or replace with a specific commit SHA
git checkout --progress patternlab/develop source/_patterns source/sass source/js/modules source/images
if [ $? != 0 ]; then
  echo "Branch or commit does not exist"
  exit 1
fi
echo "Checked out patterlab source"
git add .
mvn clean install
rm -rf source

exit 0