<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Навантаження</title>
  <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
  <div class="logo">Головне меню</div>
  <nav id="nav-menu">
    <a href="/workload">Навантаження</a>
    <a href="/teacher">Викладачі</a>
    <a href="/subject">Предмети</a>
    <a href="/login">Ввійти</a>
  </nav>
</header>



<script>
  function toggleMenu() {
    const nav = document.getElementById('nav-menu');
    nav.style.display = nav.style.display === 'flex' ? 'none' : 'flex';
  }
</script>

</body>
</html>
