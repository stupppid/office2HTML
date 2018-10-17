#!/bin/bash
exFile=$PWD'/office2HTML.exe'
root=$PWD/files
goFiles(){
for f in `ls $1`
do
	p=$1/$f
	echo $p
	if [ -d $p ];then
		cd $p;
		goFiles $p;
	else
		if [[ $f =~ 'docx' ]];then
			$exFile $p  ${p/docx/html};
		elif [[ $f =~ 'doc' ]];then
			$exFile $p ${p/doc/html};
		fi
		
	fi
done
}
goFiles $root