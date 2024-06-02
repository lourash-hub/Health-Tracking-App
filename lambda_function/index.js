const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    console.log("Event: ", event);

    const response = {
        statusCode: 200,
        body: 'Health data processed successfully'
    };

    const healthData = JSON.parse(event.body);

    const params = {
        TableName: 'Measurements',
        Item: {
            utc_timestamp: new Date().toISOString(),
            data: healthData
        }
    };

    try {
        await dynamo.put(params).promise();
        console.log('Data saved to DynamoDB');
    } catch (error) {
        console.error('Error saving data to DynamoDB', error);
        response.statusCode = 500;
        response.body = 'Error saving data to DynamoDB';
    }

    return response;
};
