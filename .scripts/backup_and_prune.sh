#!/bin/sh

### make borg backup of some files to rsync.net repository
### and prune archives in rsync.net repository

### exits with 0 iff all borg calls exited with 0
### exits with 1 iff any borg call exited with warnings
### exits with 128+N iff any borg call was killed by signal N

# warnings marker & return code checker

received_warnings=false

check_borg_return_code()
{
  if [ $1 = 1 ]; then
    received_warnings=true
  elif [ $1 = 2 ]; then
    echo "Borg exited with error. See borg log for details."
    exit 2
  elif [ $1 != 0 ]; then
    echo "Borg was killed by signal $(($1 - 128)). See borg log for details."
    exit $1
  fi
}

# change to right working directory

cd $HOME

# borg environment

export BORG_REPO=$(secret-tool lookup uuid borg_repo_rsync_location)
export BORG_REMOTE_PATH='borg1'
export BORG_LOGGING_CONF='.config/borg/logging.conf'
export BORG_PASSCOMMAND='secret-tool lookup uuid borg_repo_rsync_key_passphrase'
export BORG_RSH='ssh -oBatchMode=yes'

# variables

suffix='UTC_{utcnow:%Y-%m-%d_%H:%M:%S}'

# backup

echo -n "Backing up documents ... "
borg create ::documents_${suffix}             './Documents'
check_borg_return_code $?
echo "finished."

echo -n "Backing up archived documents ... "
borg create ::archived-documents_${suffix}    './Archived Documents'
check_borg_return_code $?
echo "finished."

echo -n "Backing up library ... "
borg create ::library_${suffix}               './Library'
check_borg_return_code $?
echo "finished."

# prune

echo -n "Pruning archives of documents ... "
borg prune --glob-archives 'documents_*' \
  --keep-last=7 \
  --keep-within=7d \
  --keep-daily=7 \
  --keep-weekly=12 \
  --keep-monthly=-1
check_borg_return_code $?
echo "finished."

echo -n "Pruning archives of archived documents ... "
borg prune --glob-archives 'archived-documents_*' \
  --keep-last=7 \
  --keep-within=4d \
  --keep-daily=3 \
  --keep-weekly=4 \
  --keep-monthly=4 \
  --keep-yearly=-1
check_borg_return_code $?
echo "finished."

echo -n "Pruning archives of library ... "
borg prune --glob-archives 'library_*' \
  --keep-last=7 \
  --keep-within=4d \
  --keep-daily=3 \
  --keep-weekly=4 \
  --keep-monthly=4 \
  --keep-yearly=-1
check_borg_return_code $?
echo "finished."

# exit

if $received_warnings; then
  echo "Script finished, but one or more borg calls exited with warnings. See borg log for details."
  exit 1
fi

echo "Script finished without warnings."
exit 0
