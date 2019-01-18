$(document).ready(function () {
// Create a client instance: Broker, Port, Websocket Path, Client ID
client = new Paho.MQTT.Client("iot.eclipse.org", Number(80), "/ws", "q1w2e3r4");
 
// set callback handlers
client.onConnectionLost = function (responseObject) {
    console.log("Connection Lost: "+responseObject.errorMessage);
}
 
client.onMessageArrived = function (message) {
  console.log("Message Arrived: "+message.payloadString);
  if(message.payloadString=="closed"){
    $('#status').html("<br>Shop is closed");
    $('#status').css({'color':"red"});
  }
  else if(message.payloadString=="open"){
    $('#status').html("<br>Shop is Open");
    $('#status').css({'color':"green"});
  }
}
 
 client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;
// Called when the connection is made
function onConnect(){
    console.log("Connected!");
    client.subscribe("shekhar/ab/ba/status");
    $('#status').html("connected");
    }

//-----------------------------------------------------------------------------------------------

// Connect the client, providing an onConnect callback
client.connect({
    onSuccess: onConnect, 
    mqttVersion: 3,
    keepAliveInterval:120

})

// called when the client loses its connection
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0) {
    console.log("onConnectionLost:"+responseObject.errorMessage);
  }
}

// called when a message arrives
function onMessageArrived(message) {
  console.log(message.payloadString);
  // if (message.payloadString=="closed") {}
  if(message.payloadString=="close"){
    $('#status').html("<br>Closed");
    $('#status').css({'color':"red"});
    $('#status2').html("<br>Closed");
    $('#status2').css({'color':"red"});
  }
  else if(message.payloadString=="open"){
    $('#status').html("<br>Open");
    $('#status').css({'color':"green"});
    $('#status2').html("<br>Open");
    $('#status2').css({'color':"green"});
  }
  
}




      });








