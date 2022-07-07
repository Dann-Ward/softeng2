<?php

class UserInfo extends Dbh
{
  protected function setUserInfo($id, $fname, $mname, $lname, $address, $num)
  {
    $stmt = $this->connect()->prepare('UPDATE user SET first_name = ?, middle_name = ?, last_name = ?, address = ?, contact_number = ? WHERE user_id = ?;');

    if (!$stmt->execute([$fname, $mname, $lname, $address, $num, $id])) {
      $stmt = null;
      header("Location: ../view/userinfo.php?error=stmtfailed");
      exit;
    }
    session_start();
    $_SESSION['fname'] = $fname;

    $stmt = null;
  }
}
