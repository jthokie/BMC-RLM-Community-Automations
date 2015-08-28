#############################################################################
# Copyright [2015] [Jon Thomas]
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#############################################################################
#
# executes jboss-cli with undeploy command
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
# DEPLOYMENT_NAME:
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

# If the user doesn't provide values for JBOSS_SERVER and JBOSS_PORT, they will be set to defaults. 

if [ -z "$JBOSS_SERVER" ]
then
    JBOSS_SERVER="localhost"
fi

if [ -z "$JBOSS_PORT" ]
then
    JBOSS_PORT="9999"
fi


$JBOSSCLI --controller="$JBOSS_SERVER:$JBOSS_PORT" --user="$JBOSS_USERNAME" --password="$JBOSS_PASSWORD" --connect --command="undeploy $DEPLOYMENT_NAME"
rc=$?

cd /tmp
rm -rf $$
exit $rc

