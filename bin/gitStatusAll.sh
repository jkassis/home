#!/usr/bin/env bash

for d in */; do
 pushd $d > /dev/null
 echo 
 echo 
 echo 
 echo vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
 echo git status for $(pwd)
 echo -----------------------------------------------------------------
 git status
 echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 popd > /dev/null
done
