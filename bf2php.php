#!/usr/bin/env php
<?php
echo '<?php' . PHP_EOL;
echo '$dseg = array();' . PHP_EOL;
echo '$dseg[0] = 0;' . PHP_EOL;
echo '$pc = 0;' . PHP_EOL;
echo '$dx = 0;' . PHP_EOL;




$stdin = file_get_contents("php://stdin");

for ($i = 0; $i < strlen($stdin); $i++) {
	$ch = $stdin[$i];
	switch ($ch) {
	case '>':
		echo '$dx++;' . PHP_EOL;
		echo 'if (isset($dseg[$dx]) == FALSE) $dseg[$dx] = 0;' . PHP_EOL;
		break;
	case '<':
		echo '$dx--;' . PHP_EOL;
		break;
	case '+':
		echo '$dseg[$dx]++;' . PHP_EOL;
		break;
	case '-':
		echo '$dseg[$dx]--;' . PHP_EOL;
		break;
	case '.':
		echo 'print chr($dseg[$dx]);' . PHP_EOL;
		break;
	case ',':
		// input from user
		break;
	case '[':
		echo 'while ($dseg[$dx] != 0) {' . PHP_EOL;
		break;
	case ']':
		echo '}' . PHP_EOL;
		break;
	default:
	}
}



