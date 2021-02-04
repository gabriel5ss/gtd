<?php

include('gtd_conn.php');

$card_title = $_POST['card_title'];
$card_body = $_POST['card_body'];
$card_status = $_POST['card_status'];
$card_id = $_POST['card_id'];

/*$card_title = "update";
$card_body = "update";
$card_status = "update";
$card_id = 5;*/
//$user_email = $_POST['email'];
//$user_senha = $_POST['senha'];

try{
    $conn = new PDO("mysql:host=$host;dbname=$dbName", $userName, $userPasswd,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //$conn->exec('set names utf8');
    //$query = "SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'";
    //$query = "SELECT card_title, card_body, card_status FROM gtd_card WHERE user_id='1'";
    $query = "UPDATE gtd_card SET card_title=:card_title, card_body=:card_body, card_status=:card_status WHERE card_id=:card_id";
    $stmt = $conn->prepare($query);
    $stmt->execute(array(
        'card_title' => $card_title,
        'card_body' => $card_body,
        'card_status' => $card_status,
        'card_id' => $card_id
    ));
    
    echo $stmt->rowCount();
    //$data = $stmt->fetchall(PDO::FETCH_ASSOC);
    //print_r($data);
    //print_r(json_encode($data));
    /*foreach ($stmt as $row) {
        # code...
        print_r(json_encode($row));
        //print_r($row);
        //print_r($row);
    }*/
} catch(PDOException $e){
    echo 'ERROR: ' . $e->getMessage();
}

?>