<?php

include('gtd_conn.php');

$card_id = $_POST['card_id'];
$id_user = 1;

/*$card_id = 6;
$id_user = 1;*/

try{
    $conn = new PDO("mysql:host=$host;dbname=$dbName", $userName, $userPasswd,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //$conn->exec('set names utf8');
    //$query = "SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'";
    //$query = "SELECT card_title, card_body, card_status FROM gtd_card WHERE user_id='1'";
    /*$query = "INSERT INTO gtd_card (user_id, card_title, card_body, card_status) VALUES 
    ((SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'), 
    :card_title, :card_body, :card_status)";*/
    $query = "DELETE FROM gtd_card WHERE card_id=:card_id AND user_id=:id_user";
    $stmt = $conn->prepare($query);
    $stmt->execute(array(
        'card_id' => $card_id,
        'id_user' => $id_user
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