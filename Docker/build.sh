#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $dir/env.sh

# copy perl and R required packages
cp $dir/../test/install_modules_cpan.pl $dir/
cp $dir/../install_packages.R $dir/

echo "building  $img_name (v $img_version)"

docker_cmd="docker build $1 --rm=true -t $img_name:$img_version  -f Dockerfile . "
echo $docker_cmd
$docker_cmd


