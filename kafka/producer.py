from kafka import KafkaProducer
import json
import random
from time import sleep
from datetime import datetime

# Create an instance of the Kafka producer
producer = KafkaProducer(bootstrap_servers='localhost:9092',
                            value_serializer=lambda v: str(v).encode('utf-8'))

# Call the producer.send method with a producer-record
print("Ctrl+c to Stop")
while True:
    rand = random.randint(10,40)
    print(rand)
    producer.send('topico-projeto', rand)
    sleep(0.2)

