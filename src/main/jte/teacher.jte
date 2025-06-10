@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Teacher
@param List<Teacher> teachers
@param String username
@param Boolean isAdmin

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця викладачів</title>
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
            <a href="/subject">Предмети</a>
            <a href="/logout">Вийти</a>
        @else
            <a href="/login">Ввійти</a>
        @endif
    </nav>
</header>

<div style="width: 90%; margin: 20px auto; display: flex; justify-content: flex-end;">
    <a href="/teacher/create" class="create-btn">Створити</a>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Прізвище</th>
        <th>Ім'я</th>
        <th>По-батькові</th>
        <th>Академічний ступінь</th>
        <th>Посада</th>
        <th>Стаж</th>
        <th>Ким створено:</th>
        <th>Дії</th>
    </tr>
    </thead>
    <tbody>
    @for(Teacher teacher : teachers)
        <tr>
            <td>${teacher.getTeacher_Id()}</td>
            <td>${teacher.getLast_Name()}</td>
            <td>${teacher.getFirst_Name()}</td>
            <td>${teacher.getSecond_name()}</td>
            <td>${teacher.getAcademic_degree()}</td>
            <td>${teacher.getPosition()}</td>
            <td>${teacher.getExperience()}</td>
            <td>
                @if(teacher.getOwner() != null)
                    ${teacher.getOwner().getUsername()}
                @else
                    Невідомо
                @endif
            </td>
            <td>
                @if(teacher.getOwner() != null && username.equals(teacher.getOwner().getUsername()) || isAdmin)
                    <button class="btn-edit" onclick="location.href='/teacher/edit/${teacher.getTeacher_Id()}'">Редагувати</button>
                    <button class="btn-del" onclick="deleteItem(${teacher.getTeacher_Id()})">Видалити</button>
                @endif
            </td>
        </tr>
    @endfor
    </tbody>
</table>

<script>
    function deleteItem(id) {
        if (confirm('Ви впевнені, що хочете видалити викладача?')) {
            fetch('/teacher/' + id, {
                method: 'DELETE'
            }).then(() => location.reload());
        }
    }
</script>

</body>
</html>
