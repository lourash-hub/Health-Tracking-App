import boto3
import requests
import json
import time

# Initialize boto3 client
dynamodb = boto3.client('dynamodb', region_name='us-east-1')

# Test the API Gateway endpoint
def test_api_gateway():
    url = "https://<api-id>.execute-api.us-east-1.amazonaws.com/dev/data"
    headers = {
        "Content-Type": "application/json"
    }
    payload = {
        "heart_rate": 70,
        "steps": 1000,
        "sleep_hours": 8
    }

    response = requests.post(url, headers=headers, data=json.dumps(payload))
    assert response.status_code == 200
    print("API Gateway Test Passed")

# Test data in DynamoDB
def test_dynamodb():
    time.sleep(10)  # Wait for the data to be written to DynamoDB
    response = dynamodb.scan(
        TableName='Measurements'
    )
    items = response['Items']
    assert len(items) > 0
    print("DynamoDB Test Passed")

# Run the tests
test_api_gateway()
test_dynamodb()
