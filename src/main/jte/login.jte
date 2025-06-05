<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Вхід</title>
  <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
  <div class="logo">Вхід до системи</div>
</header>


<form method="post" action="/login">
  <label for="username">Логін</label>
  <input type="text" id="username" name="username" required>

  <label for="password">Пароль</label>
  <input type="password" id="password" name="password" required>


  <button type="submit">Увійти</button>
  <a href="/register" type="submit">Зареєструватись</a>

</form>

</body>
</html>
