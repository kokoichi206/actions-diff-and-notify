#!/bin/bash -eu

base="1.0.1"
head="1.1.1"

if [[ "$base" != "$head" ]]; then
    echo "diff found!"
fi


base_major="1"
base_minor="0"
head_major="1"
head_minor="0"

if [[ "$base_major" != "$head_major" || "$base_minor" != "$head_minor" ]]; then
    echo "diff found!"
fi

feature=()
bugfix=()
maintenance=()

commits=`git log test..main --oneline --no-merges`

while read commit
do
    echo "i"
    echo "$commit"
    if [[ "$commit" =~ .*(feat).* ]]; then
        feature+=( "$commit" )
    elif [[ "$commit" =~ .*(bug|fix).* ]]; then
        bugfix+=( "$commit" )
    else
        maintenance+=( "$commit" )
    fi
done <<< "$commits"

echo "=== feature ==="
echo "${feature[@]}"
echo "=== bugfix ==="
echo "${bugfix[@]}"
echo "=== maintenance ==="
echo "${maintenance[@]}"


declare -a array=("a" "b" "c")
body=""
for ar in "${array[@]}"; do
    echo "$ar"
    body+="$ar\n"
done
echo "$body"


# echo "========="
# for commit in "$commits"; do
#     echo "i"
#     echo "$commit"
#     if [[ "$commit" =~ .*(feat).* ]]; then
#         feature+=( "$commit" )
#     elif [[ "$commit" =~ .*(bug|fix).* ]]; then
#         bugfix+=( "$commit" )
#     else
#         maintenance+=( "$commit" )
#     fi
# done
# echo "=== feature ==="
# echo "${feature[@]}"
# echo "=== bugfix ==="
# echo "${bugfix[@]}"
# echo "=== maintenance ==="
# echo "${maintenance[@]}"
