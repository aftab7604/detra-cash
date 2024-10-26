<?php

return [
  'php' => [
      'version' => '7.4.0',
      'extension' => ['bcmath', 'ctype', 'fileinfo', 'gd', 'json', 'mbstring', 'openssl', 'PDO', 'tokenizer', 'xml'],
      'permissions' => [
          'bootstrap/cache' => '777',
          'storage/app' => '777',
          'storage/framework' => '777',
          'storage/logs' => '777',
		  '.env' => '755'
      ],
  ],
    'pid' => '163144619222',
    'home_url' => '/',
    'portfolio_url' => 'https://codecanyon.net/user/bug-finder/portfolio',
];
