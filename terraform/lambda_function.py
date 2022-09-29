import boto3
import json

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitors_counter')

def lambda_handler(event, context):
   
    response = table.get_item(
        Key={

            'ID': 'visitors'
        }
    )
            
            
    count = response['Item']['Numbers']
    count = str(int(count) + 1)         
            
            
  
    
    response = table.put_item(
        Item = {
            'ID': 'visitors',
            'Numbers': count
        }
        
    )
            
        
    return{
        'statuscode': 200,
        'headers':{
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Orgin': '*',
            'Access-Control-Allow-Methods': '*'
        },
        'body': count
        }
    
    
        
    