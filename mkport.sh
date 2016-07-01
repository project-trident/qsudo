#!/bin/sh
# Helper script which will create the port / distfiles
# from a checked out git repo

# Set the port
port="sysutils/qsudo"
dfile="qsudo"

massage_subdir() {
  cd "$1"
  if [ $? -ne 0 ] ; then
     echo "SKIPPING $i"
     continue
  fi

comment="`cat Makefile | grep 'COMMENT ='`"

  echo "# \$FreeBSD\$
#

$comment
" > Makefile.tmp

  for d in `ls`
  do
    if [ "$d" = ".." ]; then continue ; fi
    if [ "$d" = "." ]; then continue ; fi
    if [ "$d" = "Makefile" ]; then continue ; fi
    if [ ! -f "$d/Makefile" ]; then continue ; fi
    echo "    SUBDIR += $d" >> Makefile.tmp
  done
  echo "" >> Makefile.tmp
  echo ".include <bsd.port.subdir.mk>" >> Makefile.tmp
  mv Makefile.tmp Makefile

}

if [ -z "$1" ] ; then
   echo "Usage: ./mkports.sh <portstree> <distfiles>"
   exit 1
fi

if [ ! -d "${1}/Mk" ] ; then
   echo "Invalid directory: $1"
   exit 1
fi

portsdir="${1}"
if [ -z "$portsdir" -o "${portsdir}" = "/" ] ; then
  portsdir="/usr/ports"
fi

if [ -z "$2" ] ; then
  distdir="${portsdir}/distfiles"
else
  distdir="${2}"
fi
if [ ! -d "$distdir" ] ; then
  mkdir -p ${distdir}
fi

echo "Sanity checking the repo..."
OBJS=`find . | grep '\.o$'`
if [ -n "$OBJS" ] ; then
   echo "Found the following .o files, remove them first!"
   echo $OBJS
   exit 1
fi

# Get the GIT tag
ghtag=`git log -n 1 . | grep '^commit ' | awk '{print $2}'`

# Get the version
if [ -e "version" ] ; then
  verTag=$(cat version)
else
  verTag=$(date '+%Y%m%d%H%M')
fi

# Cleanup old distfiles
rm ${distdir}/${dfile}-* 2>/dev/null

# Copy ports files
if [ -d "${portsdir}/${port}" ] ; then
  rm -rf ${portsdir}/${port} 2>/dev/null
fi
cp -r port-files ${portsdir}/${port}

# Set the version numbers
sed -i '' "s|%%CHGVERSION%%|${verTag}|g" ${portsdir}/${port}/Makefile
sed -i '' "s|%%GHTAG%%|${ghtag}|g" ${portsdir}/${port}/Makefile

# Create the makesums / distinfo file
cd "${portsdir}/${port}"
make makesum
if [ $? -ne 0 ] ; then
  echo "Failed makesum"
  exit 1
fi

# Update port cat Makefile
tcat=$(echo $port | cut -d '/' -f 1)
massage_subdir ${portsdir}/${tcat}
