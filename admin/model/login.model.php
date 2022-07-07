<?php

class Login extends Dbh
{
  protected function getUser($uid, $pwd)
  {
    $stmt = $this->connect()->prepare('SELECT password FROM user WHERE email = ?;');

    if (!$stmt->execute([$uid])) {
      $stmt = null;
      header("Location: ../index.php?error=stmtfailed");
      exit;
    }

    if ($stmt->rowCount() == 0) {
      $stmt = null;
      header("Location: ../index.php?error=usernotfound");
      exit;
    }

    $pwdHashed = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $checkedPwd = password_verify($pwd, $pwdHashed[0]['password']);

    if ($checkedPwd == false) {
      $stmt = null;
      header("Location: ../index.php?error=invalid");
      exit;
    } else {
      $pwd = $pwdHashed[0]['password'];
      $stmt = $this->connect()->prepare('SELECT * FROM user WHERE email = ? AND password = ? AND type = "Admin";');

      if (!$stmt->execute([$uid, $pwd])) {
        $stmt = null;
        header("Location: ../index.php?error=stmtfailed");
        exit;
      }

      if ($stmt->rowCount() == 0) {
        $stmt = null;
        header("Location: ../index.php?error=AdminNotFound");
        exit;
      }

      $user = $stmt->fetchAll(PDO::FETCH_ASSOC);

      session_start();

      $_SESSION['userid'] = $user[0]['user_id'];
    }

    $stmt = null;
  }
}
