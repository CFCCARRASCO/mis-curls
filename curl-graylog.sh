#!/bin/bash
# external secret requirements:
## export GRAY_AUTH=admin:mypassword

host="10.75.160.68"
# QUERY="*"
# url encoded query "level:3"
QUERY="level%3A3"
# level:3
# Full Graylog API call
#GRAY_QUERY="https://$host/api/search/universal/relative?query=$QUERY&range=3600&fields=message&limit=100&sort=timestamp:desc"
#GRAY_QUERY="https://$host/api/search/universal/keyword/export?query=%22sshd%22&keyword=%22yesterday%22&batch_size=500&fields=timestamp"
#GRAY_QUERY="https://$host/api/search/universal/absolute?query=streams%3A5b39fb77b273cb07240d9102&from=2021-07-09T10%3A15%3A00.000Z&to=2022-07-09T10%3A30%3A00.000Z&decorate=true"
GRAY_QUERY="https://$host/api/cluster?pretty=true"
#
#
GRAY_AUTH="1tdueq83vrkequae2t4ou7toocsh3l29620shrcb8pimr6dhtm6g:token"
curl --silent \
	  -i -k \
	    -u $GRAY_AUTH \
	      -H "X-Requested-By: cli" \
	        -H "Accept: application/json" \
		  -H "Content-Type: application/json" \
		    ${GRAY_QUERY} -o LAST_WARN.json

# use jq to extract message from Graylog json response
# no hace falta, "?pretty=true" lo hace.
# cat LAST_WARN.json  |jq --raw-output '.messages[].message | (.timestamp + " | " +  .gl2_remote_ip + " | " + .message) ' > LAST_WARN.log
 cat LAST_WARN.json
