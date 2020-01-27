#/bin/bash
for infile in ./test/integration/in/*; do
    outfile="./test/integration/out/${infile##*/}"
    echo "Running test for $infile and $outfile"
    diff <(stack exec singlang-exe $infile) <(cat $outfile)
    error=$?

    if [ $error -eq 0 ]
    then
    echo -e "\e[32mTest passed for $infile."
    elif [ $error -eq 1 ]
    then
    echo -e "\e[31mTest failed for $infile."
    else
    echo -e "\e[31mThere was something wrong with the diff command"
    fi

    echo -e "\e[39m"
done
