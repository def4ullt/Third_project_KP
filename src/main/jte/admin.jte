@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.logindata
@param List<logindata> loginData
@param logindata editingUser

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



<form action="/user/save" method="post" id="userForm" style="display: flex; gap: 10px; flex-wrap: wrap; align-items: center;">

    @if(editingUser != null)
        <input type="hidden" name="id" id="id" value="${editingUser.getId()}">
    @endif

    <input type="text" name="username" id="username" placeholder="Логін" required value="${editingUser != null ? editingUser.getUsername() : ""}">

    <input type="password" name="password" id="password" placeholder="Пароль">

    <select name="role" id="role" required>
        <option value="">Оберіть роль</option>
        <option value="ADMIN">ADMIN</option>
        <option value="USER">USER</option>
    </select>

    <button type="submit" class="btn-edit" id="submitBtn">
        @if(editingUser != null)
            Оновити користувача
        @else
            Додати користувача
        @endif
    </button>
</form>


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
                <a class="btn-edit" href="/user/edit/${user.getId()}">Редагувати</a>
                <button class="btn-del" onclick="deleteItem(${user.getId()})">Видалити</button>
            </td>
        </tr>
    @endfor
    </tbody>
</table>

<script>


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
