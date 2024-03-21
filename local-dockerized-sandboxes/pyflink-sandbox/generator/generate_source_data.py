################################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

from confluent_kafka import Producer
import json
from time import sleep


def write_data(producer):
    topic = "leolabsflinkin"
    with open('response.json') as f:
        data = json.load((f)) 
    while True:
        producer.produce(topic, value=json.dumps(data))
        sleep(0.5)

def create_producer():
    print("Connecting to Kafka brokers")
    kafka_sasl_username = 'admin'
    kafka_sasl_password= 'admin-secret' 
    producer_config = {
            'bootstrap.servers': 'kafka:9092',
#                    'security.protocol': 'SASL_PLAINTEXT',
#                    'sasl.mechanism': 'PLAIN',
#                    'sasl.plain_username':kafka_sasl_username,
#                    'sasl.plain_password':kafka_sasl_password

    }
    for i in range(0, 6):
        try:
            producer =  Producer(**producer_config)
            print("Connected to Kafka")
            return producer
        except Exception as e:
            print(e)
            print("Waiting for brokers to become available")
            sleep(10)

    raise RuntimeError("Failed to connect to brokers within 60 seconds")

if __name__ == '__main__':
    producer = create_producer()
    write_data(producer)
