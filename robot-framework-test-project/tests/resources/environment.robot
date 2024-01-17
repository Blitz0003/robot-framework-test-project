*** Variables ***
# host
${dev_host}       https://dev.int.us-west-2.bpg-aws-cwt.com    #internal url: https://internal-dev-non-pci-int-lb-1-583488002.us-west-2.elb.amazonaws.com    #kong url: https://dev.int.us-west-2.bpg-aws-cwt.com
${staging_host}    https://staging.int.us-west-2.bpg-aws-cwt.com    #internal url: https://internal-staging-non-pci-int-lb-1-682107277.us-west-2.elb.amazonaws.com    #kong url: https://staging.int.us-west-2.bpg-aws-cwt.com
# wiremock host
${dev_wiremock_host}    https://wiremock.dev-bpg.mycwt.com
${staging_wiremock_host}    https://wiremock.staging-bpg.mycwt.com
# mongoDB
${db_username}    taread
${db_password}    KsgdThsj!8
${db_connection_string}    dev-approval-app-documentdb.cluster-cjasiadaljfk.us-west-2.docdb.amazonaws.com:27017/trip-approval?ssl=true&ssl_ca_certs=${CURDIR}/rds-combined-ca-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false
${dbName}         trip-approval
${dbCollName}     TripApproval
# client
${client_id}      none    # used by api call
${client}         bpg-csp-approval-app-services    # used by mocks
# context path
${taa_context_path}    service/approval-app-services    #/service/approval-app-services
#OAuth credentials
${dev_client_id}    int.approval-app-services.qa
${dev_client_secret}    6sfBXqsDvi4gszVMWaoeE484pVpYnzW5
${staging_client_id}    int.trip-approval-requests.qa
${staging_client_secret}    3tsmP5Ps14eofK67qIAQMDIpl3bmpcT1
${prod_client_id}    int.trip-approval-requests.qa
${prod_client_secret}    AxkpscvRsgL3JQN94Z5BexLF2N7z4ow4
# Kafka endpoint
${publish_kafka_uri}    /approval-app-services/trip-approval-requests
${dev_kafka_host}    https://internal-dev-non-pci-int-lb-1435393786.us-west-2.elb.amazonaws.com    #https://dev.int.us-west-2.bpg-aws-cwt.com
${staging_kafka_host}    https://staging.int.us-west-2.bpg-aws-cwt.com #Get staging url from Ranjith/Ion
${dev_kafka_token}    Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwcm9tb3RlciJ9.h-kkuKOgTD6kQLpkKBPDlcGJ0qjerO2L9_1lnDKUwiLQn0vn0w66zxdWcjv9tsf8zm6il3tYZHtzSfrYybiL4Q
${staging_kafka_token}    Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwcm9tb3RlciJ9.h-kkuKOgTD6kQLpkKBPDlcGJ0qjerO2L9_1lnDKUwiLQn0vn0w66zxdWcjv9tsf8zm6il3tYZHtzSfrYybiL4Q #confirm with Ranjith
${kafka_context_path}    /kafka-qa-tool/messages
${qatool_topic}    trip-approval-request
${dev_topic}      trip-approval-request
${staging_topic}    staging-trip-approval-request
${prod_topic}     trip-approval-request
