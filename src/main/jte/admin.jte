@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.logindata
@param List<logindata> loginData

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Адмін-панель</title>
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

<!-- Форма для створення / редагування -->
<section style="margin: 20px 0;">
    <form action="/user/save" method="post" id="userForm" style="display: flex; gap: 10px; flex-wrap: wrap; align-items: center;">
        <input type="hidden" name="id" id="id">
        <input type="text" name="username" id="username" placeholder="Логін" required>
        <input type="password" name="password" id="password" placeholder="Пароль">
        <select name="role" id="role" required>
            <option value="">Оберіть роль</option>
            <option value="ADMIN">ADMIN</option>
            <option value="USER">USER</option>
        </select>
        <button type="submit" class="btn-edit" id="submitBtn">Додати користувача</button>
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
                <button class="btn-edit" onclick="fillForm(${user.getId()}, '${user.getUsername()}', '${user.getRole()}')">Редагувати</button>
                <button class="btn-del" onclick="deleteItem(${user.getId()})">Видалити</button>
            </td>
        </tr>
    @endfor
    </tbody>
</table>

<script>
    function fillForm(id, username, role) {
        document.getElementById('id').value = id;
        document.getElementById('username').value = username;
        document.getElementById('role').value = role;
        document.getElementById('password').value = '';
        document.getElementById('submitBtn').textContent = 'Оновити користувача';
    }

    function deleteItem(id) {
        if (confirm('Ви впевнені, що хочете видалити користувача?')) {
            fetch('/user/' + id, {
                method: 'DELETE'
            }).then(() => location.reload());
        }
    }
</script>

</body>
</html>
