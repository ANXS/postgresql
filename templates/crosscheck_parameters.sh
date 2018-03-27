#!/bin/bash -

#
# Identify a unique filename
#
TEMP_FILE=/tmp/`basename $0`.$$

#
# Loop through all postgresql.conf.orig files, and compare them to the j2 files
#
for FILE in postgresql.conf-[0-9]*\.orig; do
  #
  # Extract the base filename, removing ".orig"
  #
  BASE_FILE="`echo $FILE | sed s/\.orig\$//`"

  #
  # If we crash, then cleanup
  #
  trap 'rm -f ${TEMP_FILE}.orig ${TEMP_FILE}.j2 ${TEMP_FILE}.defaults' 0

  #
  # Extract a unique, sorted list of the parameter names
  #
  cat ${BASE_FILE}.orig | sed s/\#// | grep ^[a-z] | cut -f1 -d' ' | sort | uniq > ${TEMP_FILE}.orig
  cat ${BASE_FILE}.j2   | sed s/\#// | grep ^[a-z] | cut -f1 -d' ' | sort | uniq > ${TEMP_FILE}.j2
  cat ../defaults/main.yml | sed s/\#// | grep ^[a-z] | cut -f1 -d':' | sed s/^postgresql_// | sort | uniq > ${TEMP_FILE}.defaults

  #
  # Output a comparision
  #
  echo ================================================================================
  echo ${BASE_FILE}.orig ${BASE_FILE}.j2
  diff ${TEMP_FILE}.orig ${TEMP_FILE}.j2 && echo All parameters exist in both files
  echo --------------------------------------------------------------------------------
  echo ${BASE_FILE}.defaults ${BASE_FILE}.j2
  cat ${TEMP_FILE}.j2 | while read PARAM; do
    grep ^postgresql_${PARAM}: ../defaults/main.yml > /dev/null 2>&1 || echo "Missing $PARAM in ../defaults/main.yml"
  done
  echo ================================================================================
  echo

  #
  # Cleanup
  #
  rm -f ${TEMP_FILE}.orig ${TEMP_FILE}.j2 ${TEMP_FILE}.defaults
done
