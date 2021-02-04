<?php
include('gtd_conn.php');

try{
    $conn = new PDO("mysql:host=$host;dbname=$dbName", $userName, $userPasswd,
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //$conn->exec('set names utf8');
    //$query = "SELECT user_id FROM gtd_user WHERE email='teste@teste.com' AND senha='123456'";
    //$query = "SELECT card_title, card_body, card_status FROM gtd_card WHERE user_id='1'";
    $query = "SELECT card_id, card_title, card_body FROM gtd_card WHERE user_id='1'";
    $stmt = $conn->query($query);
    $data = $stmt->fetchall(PDO::FETCH_ASSOC);
    //print_r($data);
    print_r(json_encode($data));
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