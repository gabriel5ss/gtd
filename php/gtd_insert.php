<?php

include('gtd_conn.php');

/*$json = file_get_contents('php://input');

$obj = json_decode($json, true);

$card_title = $obj['card_title'];
$card_body = $obj['card_body'];
$card_status = $obj['card_status'];*/

$card_title = $_POST['card_title'];
$card_body = $_POST['card_body'];
$card_status = $_POST['card_status'];

//$user_email = $_POST['email'];
//$user_senha = $_POST['senha'];

try{
    $conn = new PDO("mysql:host=$host;dbname=$dbName", $userName, $userPasswd,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    /*$card_title = mysqli_real_escape_string($conn, $_POST['card_title']);
    $card_body = mysqli_real_escape_string($conn, $_POST['card_body']);
    $card_status = mysqli_real_escape_string($conn, $_POST['card_status']);
*/
    //$conn->exec('set names utf8');
    //$query = "SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'";
    //$query = "SELECT card_title, card_body, card_status FROM gtd_card WHERE user_id='1'";
    $query = "INSERT INTO gtd_card (user_id, card_title, card_body, card_status) VALUES 
    ((SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'), 
    :card_title, :card_body, :card_status)";
    $stmt = $conn->prepare($query);
    $stmt->execute(array(
        'card_title' => $card_title,
        'card_body' => $card_body,
        'card_status' => $card_status
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