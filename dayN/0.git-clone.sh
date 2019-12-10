#!/usr/bin/env bash
PWD=`s=$(dirname $BASH_SOURCE) && cd $s && pwd`

repo_all=(
    https://github.com/tranhuuhphuoc234/c1908g1-kakashi
    https://github.com/minhtan04/c1908g1_SUKE
    https://github.com/banhmithit18/c1908g1_thevang
    https://github.com/lamduye2411/c1908g1-playboy.git
    https://github.com/luuquocvinh/Zero
)

cd "$PWD/git-cloned/"
    for http_repo in ${repo_all[@]}; do
        git_repo=`echo $http_repo | sed s~https://github.com/~git@github.com:~g`
        echo; echo $git_repo
        git clone $git_repo
    done
cd - 1>/dev/null 2>&1
