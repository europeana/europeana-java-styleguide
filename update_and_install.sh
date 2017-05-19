#!/usr/bin/env bash
git checkout -b develop origin/develop 2>/dev/null
#Add patternlab remote
git remote add --no-tags patternlab git@github.com:europeana/Europeana-Patternlab.git 2>/dev/null
git fetch patternlab
echo "Fetch completed"
rm -rf source src target
#Checkout branch for example patternlab/develop or replace with a specific commit SHA
git checkout --progress patternlab/develop source/_patterns source/sass source/js/modules source/images
if [ $? != 0 ]; then
  echo "Branch or commit does not exist"
  exit 1
fi
echo "Checked out patterlab source"
mvn clean install
git remote remove patternlab

exit 0