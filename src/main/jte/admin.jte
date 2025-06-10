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

<!-- Форма для додавання користувача -->
<section style="margin: 20px 0;">
    <form action="/user/add" method="post" style="display: flex; gap: 10px; flex-wrap: wrap; align-items: center;">
        <input type="text" name="username" placeholder="Логін" required>
        <input type="password" name="password" placeholder="Пароль" required>

        <select name="role" required>
            <option value="">Оберіть роль</option>
            <option value="ADMIN">ADMIN</option>
            <option value="USER">USER</option>
        </select>

        <button type="submit" class="btn-edit">Додати користувача</button>
    </form>
</section>

<!-- Таблиця користувачів -->
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
            <td>
                <button class="btn-edit" onclick="location.href='/user/edit/${user.getId()}'">Редагувати</button>
                <button class="btn-del" onclick="deleteItem(${user.getId()})">Видалити</button>
            </td>
        </tr>
    @endfor
    </tbody>
</table>


<script>
    function deleteItem(id) {
        if (confirm('Ви впевнені, що хочете видалити предмет?')) {
            fetch('/user/' + id, {
                method: 'DELETE'
            }).then(() => location.reload());
        }
    }
</script>

</body>
</html>
