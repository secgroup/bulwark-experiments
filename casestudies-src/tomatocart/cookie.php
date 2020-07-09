<?php

// Workaround for TomatoCart Admin Panel login problem
session_name('toCAdminID');
 if (session_start())
 {
	 echo "Admin cookie session created.";
 } else {
	 echo "Error.";
 }

?>
