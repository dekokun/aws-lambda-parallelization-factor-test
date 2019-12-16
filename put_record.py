import sys
import random
import time
import json
import boto3

profile = 'default'
session = boto3.session.Session(profile_name=profile)
client = session.client('kinesis')

args = sys.argv
streamName = args[1]

for i in range(500):
    data = {}
    data['ID'] = i
    data['TimeStamp'] = int(round(time.time()*1000))
    res = client.put_record(
        StreamName=streamName,
        Data=json.dumps(data),
        PartitionKey=str(i)
    )
    print(res)

    time.sleep(0.1)
