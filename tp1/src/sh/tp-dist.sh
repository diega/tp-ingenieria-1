#!/bin/sh
TP1_HOME=/home/diego/facu/ingenieria-software-1/tp-ingenieria-1/tp1
GENERATED_SRC=$TP1_HOME/generated-src
TARGET=$TP1_HOME/target
DIA_EXPORT_FORMAT=png

ORIGINAL_FOLDER=`pwd`

if [ ! -d $GENERATED_SRC ]; then
  echo 'creando: '$GENERATED_SRC 
  mkdir $GENERATED_SRC
fi

if [ ! -d $TARGET ]; then
  echo 'creando: '$TARGET 
  mkdir $TARGET
fi

for diagram in $TP1_HOME/src/dia/*.dia
do
  dia_file=${diagram##*/}
  exported_file=${dia_file%.dia}
  dia --export=$GENERATED_SRC/$exported_file.$DIA_EXPORT_FORMAT $diagram
done

cd $TP1_HOME/src/tex
latex tp.tex
mv tp.pdf $TARGET
cd $ORIGINAL_FOLDER
