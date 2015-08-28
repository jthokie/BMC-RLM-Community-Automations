#############################################################################
# Copyright @ 2012-2015 BMC Software, Inc.                                  #
# This script is supplied as a template for performing the defined actions  #
# via the BMC Release Process Management. This script is written        #
# to perform in most environments but may require changes to work correctly #
# in your specific environment.                                             #
#############################################################################
#
# executes jboss-cli with deploy command
#

###
#
# JBOSS_USERNAME:
#   name: JBOSS_USERNAME
#   position: A1:B1
#   type: in-text
# JBOSS_PASSWORD:
#   name: JBOSS_PASSWORD
#   position: A2:B2
#   type: in-text
#   private: yes
# JBOSS_SERVER:
#   name: JBOSS_SERVER
#   type: in-text
#   position: A3:B3
# JBOSS_PORT:
#   name: JBOSS_PORT
#   type: in-text
#   position: A4:B4
# JBOSS_HOME:
#   name: JBOSS_HOME
#   type: in-text
#   position: A5:B5
# CONTENT_PATH:
#   name: CONTENT_PATH
#   type: in-text
#   position: A6:B6
#
###


mkdir /tmp/$$
cd /tmp/$$

if [ -z "$JBOSS_USERNAME" ]
then
    JBOSS_USERNAME="admin"
fi
if [ -z "$JBOSS_HOME" ]
then
    JBOSSCLI="jboss-cli.sh"
else
    JBOSSCLI="$JBOSS_HOME/bin/jboss-cli.sh"
fi

# If the user doesnât provide values for JBOSS_SERVER and JBOSS_PORT, they will be set to defaults. 

if [ -z "$JBOSS_SERVER" ]
then
    JBOSS_SERVER="localhost"
fi

if [ -z "$JBOSS_PORT" ]
then
    JBOSS_SERVER="9999"
fi


$JBOSSCLI --controller="$JBOSS_SERVER:$JBOSS_PORT" --user="$JBOSS_USERNAME" --password="$JBOSS_PASSWORD" --connect --command="deploy $CONTENT_PATH"
rc=$?

cd /tmp
rm -rf $$
exit $rc

