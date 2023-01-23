<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$input = json_decode(file_get_contents('php://input'), true);

 $orderId = $input["orderId"];
 $orderAmount = $input["orderAmount"];
 $referenceId = $input["referenceId"];
 $txStatus = $input["txStatus"];
 $paymentMode = $input["paymentMode"];
 $txMsg = $input["txMsg"];
 $txTime = $input["txTime"];
 $signature = $input["signature"];
 $secretkey = $input["secretKey"];
 $data = $orderId.$orderAmount.$referenceId.$txStatus.$paymentMode.$txMsg.$txTime;
 $hash_hmac = hash_hmac('sha256', $data, $secretkey, true) ;
 $computedSignature = base64_encode($hash_hmac);
 $inputData = array(
    'orderId' => $orderId,
    'orderAmount' => $orderAmount,
    'referenceId' => $referenceId,
    'txStatus' => $txStatus,
    'paymentMode' => $paymentMode,
    'txMsg' => $txMsg,
    'txTime' => $txTime
 );

 if ($signature == $computedSignature && $txStatus == "SUCCESS") {
    $data2 = array(
  'txStatus' => true,
  'data' => $inputData
);
  } else {
   $data2 = array(
  'txStatus' => false,
  'data' => $inputData
);
 }

$response = json_encode($data2);
echo $response;
?>