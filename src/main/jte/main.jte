@param String username
@param Boolean isAdmin

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
    @if(username != null)
    <span>Ви увійшли як <strong>${username}</strong></span>
    @endif
    @if(isAdmin)
    <a href="/adminPanel">Панель даних для входу</a>
    @endif
    @if(username != null)
    <a href="/workload">Навантаження</a>
    <a href="/teacher">Викладачі</a>
    <a href="/subject">Предмети</a>
    <a href="/logout">Вийти</a>
    @else
      <a href ="/login">Ввійти</a>
    @endif
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
