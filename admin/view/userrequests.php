<?php
$data = [
  'title' => 'CIP Requests',
  'dir' => '../../'
];

session_start();

if (!isset($_SESSION['userid']) && !isset($_GET['id'])) {
  header('Location: ../../index.php');
  exit;
}

include_once '../database/database.php';

class DisplayData extends Dbh
{
  public function getUserData($id)
  {
    $stmt = $this->connect()->prepare('SELECT * FROM user_request ur INNER JOIN ci_activity ci ON ur.activity_id = ci.activity_id AND ur.user_id = ? INNER JOIN user u  WHERE ur.user_id = u.user_id;');
    $result = 0;

    if (!$stmt->execute([$id])) {
      $stmt = null;
      exit;
    }

    if ($stmt->rowCount() == 0) {
      $stmt = null;
      return $result;
    }

    while ($row = $stmt->fetchAll(PDO::FETCH_ASSOC)) {
      $result = $row;
    }

    $stmt = null;
    return $result;
  }

  public function getFilteredData($id, $status)
  {
    $stmt = $this->connect()->prepare('SELECT * FROM user_request ur INNER JOIN ci_activity ci ON ur.activity_id = ci.activity_id AND ur.user_id = ? AND ur.request_status = ? INNER JOIN user u  WHERE ur.user_id = u.user_id;');
    $result = 0;

    if (!$stmt->execute([$id, $status])) {
      $stmt = null;
      exit;
    }

    if ($stmt->rowCount() == 0) {
      $stmt = null;
      return $result;
    }

    while ($row = $stmt->fetchAll(PDO::FETCH_ASSOC)) {
      $result = $row;
    }

    $stmt = null;
    return $result;
  }

  public function getSearchData($id, $query)
  {
    $stmt = $this->connect()->prepare('SELECT * FROM user_request ur INNER JOIN ci_activity ci ON ur.activity_id = ci.activity_id AND ur.user_id = ?;');
    $result = 0;

    if (!$stmt->execute([$query, $id])) {
      $stmt = null;
      exit;
    }

    if ($stmt->rowCount() == 0) {
      $stmt = null;
      return $result;
    }

    while ($row = $stmt->fetchAll(PDO::FETCH_ASSOC)) {
      $result = $row;
    }

    $stmt = null;
    return $result;
  }
}

$display = new DisplayData();

if (!isset($_GET['status'])) {
  $records = $display->getUserData($_GET['id']);
} else {
  $records = $display->getFilteredData($_GET['id'], $_GET['status']);
}

include_once '../layouts/header.php';
include_once '../layouts/navbar.php';
include_once '../layouts/sidebar.php';
include_once '../pages/userrequests/main.php';
include_once '../layouts/footer.php';
