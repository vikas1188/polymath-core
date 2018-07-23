'use strict';

// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');
// Load the config file and read it in JSON format using the read-ymal
let read = require('read-yaml');
let config = read.sync('config.yml');
//setup the logger
let logger = require('../utils/logger.js').logger;
let chalk = require('chalk');
let asyncLoop = require('node-async-loop');
// queue varible
let sqs;

try {
    // Create an SQS service object
    sqs = new AWS.SQS({
        accessKeyId: config.aws_sqs_settings.aws_access_key_id,
        secretAccessKey: config.aws_sqs_settings.aws_secret_access_key,
        region: config.aws_sqs_settings.region,
        apiVersion: '2012-11-05'
    });
} catch(error) {
    logger.error(`Not able to read the configuration variables more info: ${error}`);
}



export async function listQueues() {
    var params = {};
    sqs.listQueues(params, function(err, data) {
    if (err) {
        logger.error("Problem in accessing the list of queues", err.message);
        return;
    } else {
        logger.info("Success", data.QueueUrls);
        return data.QueueUrls;
    }
    });
}

export async function getQueueUrl(queue_name) {
    return new Promise((resolve, reject) => {
        var params = {
            QueueName: queue_name
          };
          sqs.getQueueUrl(params, function(err, data) {
            if (err) {
                logger.error(`Queue name is not found for more description check the error message: ${err}`);
                return reject(err);
            } else {
                logger.info(`Success: ${data.QueueUrl}`);
                return resolve(data.QueueUrl);
            }
          });
    });
}

export async function pushMessage(queueName, scheduleTime, queryId) {
    return new Promise(async (resolve,reject) => {
    let queue_url = await getQueueUrl(queueName);
    var params = {
        MessageBody: `{"scheduleTime": ${scheduleTime}, "queryId": "${queryId}"}`,
        QueueUrl: queue_url,
        MessageDeduplicationId: Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15),
        MessageGroupId: "abcdef12345"
       };
       sqs.sendMessage(params, function(err, data) {
         if (err) {
            logger.error(`Not able to send the message for more info: ${err}`);
            return reject(null);
         } else {
            logger.info(`Success: ${data.MessageId}`);
            return resolve(data.MessageId);
         }
       });
    })
}

export async function readMessage(queueName, numberOfMessages) {
    return new Promise(async (resolve,reject) => {
    let queueURL = await getQueueUrl(queueName);
    var params = {
        MaxNumberOfMessages: numberOfMessages,
        QueueUrl: queueURL,
        VisibilityTimeout: 5,
        WaitTimeSeconds: 0
       };
       sqs.receiveMessage(params, function(err, data) {
         if (err) {
           logger.error(`Receive Error in reading the queue: ${err}`);
           return reject(null);
         } else {
             logger.info(`Message read successfully, messageId :${data.Messages}`);
             return resolve(data.Messages);
         }
       });
    })
}

export async function deleteMessage(queueName, ReceiptHandle) {
    return new Promise(async (resolve,reject) => {
    let queueURL = await getQueueUrl(queueName);
    var deleteParams = {
        QueueUrl: queueURL,
        ReceiptHandle: ReceiptHandle
      };
      sqs.deleteMessage(deleteParams, function(err, data) {
        if (err) {
          logger.error(`Error in deleting the receipt handle: ${deleteParams.ReceiptHandle} error message: ${err.message}`);
          return reject(null);
        } else {
          logger.info(`Successfully delete the receipt handle: ${deleteParams.ReceiptHandle}, response data: ${data}`);
          return resolve(deleteParams.ReceiptHandle);
        }
      });
    });
}


export async function getQueueLength(queueName) {
    return new Promise(async (resolve,reject) => {
    let queueURL = await getQueueUrl(queueName);
    sqs.getQueueAttributes({QueueUrl: queueURL, AttributeNames: ["ApproximateNumberOfMessages","ApproximateNumberOfMessagesNotVisible"]}, function(err, data) {
        if(err) {
            logger.error(`unable to get the queue attributes of queue: ${queueName}`);
            return reject(null);
        } else {
            let length = parseInt(data.Attributes.ApproximateNumberOfMessages) + parseInt(data.Attributes.ApproximateNumberOfMessagesNotVisible);
            logger.info(`Approximate Length of ${chalk.yellow(`${queueName}`)} queue is: ${chalk.green(`${length}`)}`);
            return resolve(length);
        }
    });
    })
}

export async function deleteAllMessages(queueName) {
    return new Promise(async (resolve,reject) => {
        let batches = new Array();
        let queueURL = await getQueueUrl(queueName);
        let lastBatcheLen = await getQueueLength(queueName) % 10;
        let length = Math.floor(await getQueueLength(queueName)/10);
        for (let i = 0; i <length; i++) {
            batches.push(10);
        }
        if (lastBatcheLen !=0) {
            batches.push(lastBatcheLen);
        }
        console.log(batches);
        asyncLoop(batches, async(len, next)=> {
            let idToDeleted = new Array();
            let data = await readMessage(queueName, len);
            asyncLoop(data, async(chunk, next) => {
                logger.info(`Id: ${chunk.MessageId}  ReceiptHandle: ${chunk.ReceiptHandle}`);
                //await deleteMessage(queueName, chunk.ReceiptHandle);
                idToDeleted.push({"Id": `${chunk.MessageId}`, "ReceiptHandle": `${chunk.ReceiptHandle}`});
                return next(null);
            })
            await deleteMessagesPerId(idToDeleted, queueURL);
         })
        })
}

export async function deleteMessagesPerId(idToDeleted, queueURL) {
    return new Promise(async (resolve,reject) => {
        var params = {
            Entries: idToDeleted,
            QueueUrl: queueURL,
        };
       sqs.deleteMessageBatch(params, function(err, data) {
         if (err) {
           logger.error(`Receive Error in reading the queue: ${err}`);
           return reject(null);
         } else {
             logger.info(`Successfully delete a batch of ${idToDeleted.length} message Id`);
             console.log(data);
             return resolve("success");
         }
    })
    })
}

export async function purgeQueue(queueName) {
    return new Promise(async (resolve,reject) => {
        let queueURL = await getQueueUrl(queueName);
        var params = {
            QueueUrl: queueURL
        };
       sqs.purgeQueue(params, function(err, data) {
         if (err) {
           logger.error(`Receive Error in purging the queue: ${err.message}`);
           return reject(null);
         } else {
             logger.info(`Successfully purge the queue: ${data.ResponseMetadata.RequestId}`);
             return resolve("success");
         }
    })
})
}

    