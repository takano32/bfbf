#!/usr/bin/env php
<?php
$stdin = file_get_contents("php://stdin");

for ($i = 0; $i < strlen($stdin); $i++) {
	echo $ch = $stdin[$i];
	switch ($ch) {
	case 'h':
		echo 'this is h';
		break;
	default:
	}
}



