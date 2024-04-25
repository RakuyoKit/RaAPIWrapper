#!/bin/zsh
# Authoer: Rakuyo
# Update Date: 2024.04.25

project_path=$(cd `dirname $0` ; pwd)

cd $project_path

while read line
do
    if [[ $line =~ "s.name" ]] ; then
        name=`echo $line | cut -d = -f 2 | cut -d \' -f 2`
    fi

    if [[ $line =~ "s.version" ]] ; then
        version=`echo $line | cut -d = -f 2 | cut -d \' -f 2`
        break
    fi
done < $(find . -name '*.podspec' -not -path './.build/*')

execute_pod(){
    pod $1 $2 $name.podspec --allow-warnings --skip-tests
}

lint_pod(){
    execute_pod lib lint
}

git_merge() {
    local from_branch=$1
    local to_branch=$2
    local merge_message=$3

    git checkout "$to_branch"
    git merge --no-ff -m "$merge_message" "$from_branch" --no-verify
    git_push "$to_branch" --no-verify
}

git_push() {
    git push origin "$1" --no-verify
}

release(){
    main_branch="main"
    develop_branch="develop"
    release_branch=release/$version

    if git show-branch develop &>/dev/null; then
        source_branch=$develop_branch
    else
        source_branch=$main_branch
    fi

    git checkout -b "$release_branch" "$source_branch"

    git_message="release: version $version"
    git add . && git commit -m "$git_message" --no-verify

    git_merge "$release_branch" "$main_branch" "Merge branch '$release_branch'"

    git tag "$version"
    git_push "$version"

    if [ "$source_branch" == "$develop_branch" ]; then
        git_merge "$version" "$develop_branch" "Merge tag '$version' into $develop_branch"
    fi

    git branch -d $release_branch

    execute_pod trunk push
}

lint_pod && release

#echo "Whether to skip local verification? [Y/N]？"
#if read -t 5 is_skip_lint; then
#    case $is_skip_lint in
#    (N | n)
#        lint_pod && release;;
#    (*)
#        release;;
#    esac
#else
#    release
#fi
