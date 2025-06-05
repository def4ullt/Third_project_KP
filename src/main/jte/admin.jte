@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.logindata
@param List<logindata> loginData


<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця предметів</title>
    <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
    <a class="logo" href="/">Головне меню</a>
    <nav id="nav-menu">
        <a href="/subject">Предмети</a>
        <a href="/workload">Навантаження</a>
        <a href="/teacher">Викладачі</a>
        <a href="/logout">Вийти</a>
    </nav>
</header>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Логін</th>
        <th>Пароль</th>
        <th>Роль</th>
        <th>Дії</th>
    </tr>

    </thead>
    <tbody>
    @for(logindata user : loginData)
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getUsername()}</td>
            <td>${user.getPassword()}</td>
            <td>${user.getRole()}</td>
            <td></td>
        </tr>
    @endfor
    </tbody>
</table>

</body>
</html>