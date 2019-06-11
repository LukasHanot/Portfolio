#!/bin/bash
#============================================================
#          FILE:  backuptar.sh
#         USAGE:  ./backuptar.sh
#   DESCRIPTION: 
#
#       OPTIONS:  optional $1 directory
#  REQUIREMENTS:  tar
#        AUTHOR:  Jan Celis (jan.celis@kdg.be)
#       COMPANY:  KdG
#       VERSION:  1.1
#       CREATED:  11/02/14 13:42:38 CET
#      REVISION:  ---
#============================================================

backupdir="${HOME}"
backupregex="*.sh"
backupfile="${backupdir}/Backup_`date +'%Y_%m_%d_%H_%M_%S'.tar`" 
errorlog="/var/log/error_`basename $0`.log"
backuplog="/var/log/backup_`basename $0`.log"

# Nakijken eerste argument
if [ -n "$1" ]; then
  if [ -d "$1" ]; then
    backupdir="$1"
    else
    echo " Het opgegeven argument moet een directory zijn" >&2
    echo " bv ./`basename $0` $HOME" >&2
    exit 1
  fi
fi
# Opvangen van kanaal 1 en kanaal 2!
find ${backupdir} -mtime -5 -iname "${backupregex}" 
-exec tar -rPvf ${backupfile} {} \; >> ${backuplog} 2>> ${errorlog}
gzip ${backupfile}











