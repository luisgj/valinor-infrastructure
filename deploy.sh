#!/bin/bash
set -e

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
output_file="outputs.json"
timestamp=$(date +"%T")
eflag=false

checkforFile() {
  VAR_FILE="$ENVIRONMENT"
  if ! [ -f "$VAR_FILE" ]; then
      echo "ERROR: No variables file was found."
      exit 1;
  fi
}

usage() {
  echo "run: $ ./deploy.sh -e <my_tfvars_file>"
}

while getopts "he:" opt; do
    case "$opt" in
    e) eflag=true; ENVIRONMENT=$OPTARG;;
    h ) usage; exit;;
    \?) echo "Unknown option: -$OPTARG" >&2; exit 1;;
    :) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    *) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

if ! $eflag
then
    echo "ERROR: -e must be included when a directory is specified" >&2
    exit 1
fi

checkforFile
echo "Initializing deploy for tfvars: $ENVIRONMENT"

format() {
  echo "Formatting files..."
  terraform fmt
}

validate() {
  echo "Validating configurations..."
  terraform validate
}

plan() {
  echo "Planning resources application..."
  terraform plan -out "./plans/plan_$timestamp.tfplan" -var-file "$VAR_FILE"
}

apply() {
  echo "Applying resources..."
  terraform apply -var-file "$VAR_FILE"
}

format
validate
plan
apply

exit 0
