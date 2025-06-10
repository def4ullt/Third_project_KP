@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Subject
@param List<Subject> subjects
@param String username
@param Boolean isAdmin


<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця предметів</title>
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
            <a href="/logout">Вийти</a>
        @endif
    </nav>
</header>


<div style="width: 90%; margin: 20px auto; display: flex; justify-content: flex-end;">
    <button href="/create" class="create-btn">Створити</button>
</div>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Назва предмету</th>
        <th>Кількість годин</th>
        <th>Ким створено:</th>
        <th>Дії</th>
    </tr>

    </thead>
    <tbody>
    @for(Subject subject : subjects)
        <tr>
            <td>${subject.getSubject_id()}</td>
            <td>${subject.getName()}</td>
            <td>${subject.getHours()}</td>
            <td>
                @if(subject.getOwner() != null)
                    ${subject.getOwner().getUsername()}
                @else
                    Невідомо
                @endif
            </td>
            <td>
                @if(subject.getOwner() != null && username.equals(subject.getOwner().getUsername()) || isAdmin)
                    <button class="btn-edit" onclick="location.href='/subject/edit/${subject.getSubject_id()}'">Редагувати</button>
                    <button class="btn-del" onclick="deleteItem(${subject.getSubject_id()})">Видалити</button>
                @endif
            </td>
        </tr>
    @endfor
    </tbody>
</table>
<script>
    function deleteItem(id) {
        if (confirm('Ви впевнені, що хочете видалити предмет?')) {
            fetch('/subject/' + id, {
                method: 'DELETE'
            }).then(() => location.reload());
        }
    }
</script>
</body>
</html>