import base64
import json
import time


def lambda_handler(event, context):
    print ('start handler')
    count = len(event['Records'])
    print ('Get record count:')
    print (count)

    for record in event['Records']:
        payload = base64.b64decode(record['kinesis']['data']).decode("utf-8")
        print("Payload: " + payload)
    time.sleep(1)
    return 'Successfully {} records.'.format(count)
