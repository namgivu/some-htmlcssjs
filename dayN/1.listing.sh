#!/usr/bin/env bash
PWD=`s=$(dirname $BASH_SOURCE) && cd $s && pwd`

cd "$PWD/git-cloned/"
    students=()

    teams=`find .  -maxdepth 1 -type d`
    for t in ${teams[@]}; do
        if [[ $t == '.' ]]; then continue; fi

        t_full=`cd $t && pwd`
        readme="$t_full/README.md"
        [[ -f $readme ]] || echo "README.md not found at team=$t"

        python << EOF
with open('$readme', 'r') as f: rows = f.read()
sp = rows.split('\n')
team = sp[1]
for i in range(2, len(sp)):
    if sp[i]: print(f'{team}, {sp[i]}')
EOF
    done

    for s in "${students[@]}"; do
        echo "$s"
    done
cd - 1>/dev/null 2>&1
